# Dataset_BloodGluose

Collect the photoacoustic signal of glucose (glucose solution). In total, 192 samples are in this repository, and the data is saved in mat format(real-data_total.mat).

> * A total of 4 experiments have been carried out so far, and 46, 27, 56, and 63 samples have been obtained respectively.  
> * In real-data_total.mat, data is a $N \times M$ matrix, and each sample is a row vector. N is the number of sample, and M is the length of signal.
> * In real-data_total.mat, tmp_con is the concentration vector ($1 \times N$), and the unit is mg/dL.

## Basic information

### (1) Equipment  

![image](https://github.com/wcs7846/Dataset_BloodGluose/blob/main/image/work.png)  
***

### (2) Schematic Diagram  

![image](https://github.com/wcs7846/Dataset_BloodGluose/blob/main/image/machine.png)  
***

### (3) Key Parameter

* Pulsed Laser

>*WaveLength*: 1064 nm  
>*Single Pulse Energy*: 6.7 mJ  
>*Pulse Width*: 11.5 ns  

* Ultrasonic sensor  

>*Type*: DAOBO (made-in-China)

* Signal Amplifier  

>*Type*: Aigtek, ATA-5220
>*Bandwidth*: 1kHz-5MHz
>*Gain*: 60dB

## Data description  

The folder named number contains the origin data, and the meaning of these number is the data. For example, 20220418 = 2022/04/18  

The data is saved in CSV format, and demo.m is a MATLAB script to convert these data into a mat file, named real-dataX (X=2,3,4,5).  

> * importfile.m/importfile_other.m is used to extracted the data from these CSV files.
> * searchfile.m is also an auxiliary function  

[Tips] Not all data can be used for testing, because some data have artificial influence during the acquisition process, which makes the signal too strong/too weak, etc.

> * The selected data were those believed reasonable by the authors.
> * In each experiment, the photoacoustic signal intensity needs to be greater than or equal to the signal intensity of water.  

[Water is benchmark] The signal intensity of each experiment was normalized against the signal intensity of water. That is, divide each signal by the peak photoacoustic signal intensity of water in that experiment.

### Four samples of water

![image](https://github.com/wcs7846/Dataset_BloodGluose/blob/main/image/water.png)  

## Author

Copyright: 2018-9-4 MarkLHF, UESTC IDIPLab.(e-mail: 2751867750@qq.com)  
>[ORCID] [0000-0002-8201-5948](https://orcid.org/my-orcid?orcid=0000-0002-8201-5948)

## Language

MATLAB (currently)  

## History

2021-5-9 upgraded some neccessary data.  
