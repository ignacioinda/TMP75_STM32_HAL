# TMP75 Library STM32 HAL

Library with basic functions to use the temperature sensor TMP75C-Q1 
* [Datasheet](http://www.ti.com/lit/ds/symlink/tmp75c-q1.pdf)

## Getting Started

The project was created to be used on the microcontroller STM32l152RCT6 of the DiscoveryL152c. It is possible to export the project to any microcontroller stm32 since the abstraction of hal allows us.


### Main functions

```
void Tmp75_Init(void);
void Write_Register(uint8_t register_pointer, uint16_t register_value);
void Read_Register(uint8_t register_pointer, uint8_t* receive_buffer);
void Read_TempCelsius(float* receive_buffer);
void Read_TempEeprom(uint16_t* receive_buffer);
void One_ShotTemp(void);
```


## Authors

* **Ignacio Inda** - *Initial work* - [ignacioinda](https://github.com/ignacioinda)




