#include "Tmp75.h"

I2C_HandleTypeDef hi2c2;

void Tmp75_Init(void) {
	/*configuration register = 0x01
	 [res][res][OS][FQ][POL][TM][SD][RES][RES][RES][RES][RES][RES][RES][RES][RES]
	   0    0   1   0    0    0   0   0    0    0    0    0    0    0    0    0   =  0x2000
	 */
	Write_Register(0x01, 0x2000);

}

void Write_Register(uint8_t register_pointer, uint16_t register_value) {
	uint8_t data[3];
	data[0] = register_pointer;     // TMP75_ADDR
	data[1] = register_value >> 8;    // MSB byte of 16bit data
	data[2] = register_value;       // LSB byte of 16bit data

	HAL_I2C_Master_Transmit(&hi2c2, TMP75_ADDR, data, 3, 100);

}

void Read_Register(uint8_t register_pointer, uint8_t* receive_buffer) {
	// first set the register pointer to the register wanted to be read
	HAL_I2C_Master_Transmit(&hi2c2, TMP75_ADDR, &register_pointer, 1, 100);

	// receive the 2 x 8bit data into the receive buffer
	HAL_I2C_Master_Receive(&hi2c2, TMP75_ADDR, receive_buffer, 2, 100);
}

void One_ShotTemp(void) {
	//One-Shot register = 0x04 and write any value to start aconversion
	Write_Register(0x04, 0x0000);
}

void Read_TempCelsius(float *receive_buffer) {
	uint8_t buffer[2];
	uint16_t TempSum;
	Read_Register(0x00, buffer);
	TempSum = (((buffer[0] << 8) | buffer[1]) >> 4);
	*receive_buffer = (TempSum * FTMP75_TEMP_AD_STEP);
}

void Read_TempEeprom(uint16_t* receive_buffer) {
	uint8_t buffer[2];
	Read_Register(0x00, buffer);
	*receive_buffer = (((buffer[0] << 8) | buffer[1]) >> 4);
}

