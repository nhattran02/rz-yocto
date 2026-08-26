# meta-rz-multi-os

This is a Multi-OS feature that provides support for the RZ Group of 64bit Arm-based MPUs from Renesas Electronics. Currently the following boards and MPUs are supported:

- Board: RZG2L SMARC Evaluation Kit / MPU: R9A07G044L (RZ/G2L)
- Board: RZG2LC SMARC Evaluation Kit / MPU: R9A07G044C (RZ/G2LC)
- Board: RZG2UL SMARC Evaluation Kit / MPU: R9A07G043U (RZ/G2UL)
- Board: RZG3S SMARC Evaluation Kit / MPU: R9A08G045 (RZ/G3S)
- Board: RZG3E SMARC Evaluation Kit / MPU: R9A09G047 (RZ/G3E)
- Board: RZV2L SMARC Evaluation Kit / MPU: R9A07G054L (RZ/V2L)
- Board: RZV2H Evaluation Version 1 / MPU: R9A09G057H44 (RZ/V2H)
- Board: RZV2N Evaluation Kit / MPU: R9A09G056N44 (RZ/V2N)
- Board: RZT2H Evaluation Board / MPU: R9A09G077M44 (RZ/T2H)
- Board: RZN2H Evaluation Board / MPU: R9A09G087M44 (RZ/N2H)

## Build Instructions

Assume that $WORK is the current working directory.

Download proprietary Multi-OS package from Renesas.
To download Multi-OS package, please use the following link:

    English: https://www.renesas.com/us/en/software-tool/rzg-multi-os-package
    Japanese: https://www.renesas.com/jp/ja/software-tool/rzg-multi-os-package

Please choose correct package that matches with your MPU.
After downloading the proprietary package, please decompress them then put meta-rz-features folder at $WORK.

- To apply Multi-OS feature, please run the script below:
```bash
   $ bash ../meta-rz-features/meta-rz-multi-os/add_meta_layer.sh
```
Then, select the platform corresponding to your Renesas MPU. The available platforms are listed below:

|Renesas MPU| platform options |
|:---------:|:--------:|
|RZ/G2L     |meta-rzg2l-vlp3, meta-rzg2l-vlp4     |
|RZ/G2LC    |meta-rzg2l-vlp3, meta-rzg2l-vlp4     |
|RZ/G2UL    |meta-rzg2l-vlp3, meta-rzg2l-vlp4     |
|RZ/G3S     |meta-rzg3s-vlp3, meta-rzg3s-vlp4     |
|RZ/G3E     |rzg3e     |
|RZ/V2L     |meta-rzv2l-vlp3, meta-rzv2l-vlp4     |
|RZ/V2H     |rzv2h     |
|RZ/V2N     |rzv2n     |
|RZ/T2H     |rzt2h     |
|RZ/N2H     |rzn2h     |