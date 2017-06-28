 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %  
 % Copyright (c) 2017, BigCat Wireless Pvt Ltd
 % All rights reserved.
 % 
 % Redistribution and use in source and binary forms, with or without
 % modification, are permitted provided that the following conditions are met:
 % 
 %     * Redistributions of source code must retain the above copyright notice,
 %       this list of conditions and the following disclaimer.
 %
 %     * Redistributions in binary form must reproduce the above copyright
 %       notice, this list of conditions and the following disclaimer in the
 %       documentation and/or other materials provided with the distribution.
 %
 %     * Neither the name of the copyright holder nor the names of its contributors
 %       may be used to endorse or promote products derived from this software
 %       without specific prior written permission.
 % 
 % 
 % 
 % THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 % AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 % IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 % DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 % FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 % DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 % SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 % CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 % OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 % OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 % 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% DUC_LINEUP_param - DSPBA Design Parameters Start
clear DUC_LINEUP_param; 

addpath library/cfr
addpath library/complex_real
addpath library/cordic
addpath library/dpd
addpath library/hduc
addpath library/iq_splitter
addpath library/iq_mixer
addpath library/lduc
addpath library/mixer
addpath library/pipe_reg
addpath library/real_complex
addpath library/summer

%DSPBA_Features.additionalQuartusTclSettings = 'source ./additional_settings.qsf';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pipe Line Constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DSPBA_Features.schedulerAttempts = 1000;
DSPBA_Features.pipelineAdderUsingWidth = 20;

% Forcing DSPBA to chain FIRs with upto 80 DSP blocks together.
 DSPBA_Features.maxDSPBlockChainLength = 33;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Specify whether to generate Co-efficients or use(load) already existing co-efficient
% To Load co-efficient from file which is generated from filter Design
% Analysis tool,  the file format should be .txt file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
duc_coeff='load'; duc_config='8c8t8r_coeff_cfg_01'; 
%%coeff='generate';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify DUC NCO Tunning  Values in the oder of [ A1C1 A1C2 A1C3 A1C4 A1C5 A1C6 A1C7 A1C8 A2C1 A2C2 A2C3 A2C4 A2C5 A2C6 A2C7 A2C8] in MHz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 DUC_LINEUP_param.NCO_ant12.Freq               =  [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
 DUC_LINEUP_param.NCO_ant34.Freq               =  [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 

%  DUC_LINEUP_param.NCO_ant12.Freq          =  [-30 -10 10 30 -30 -10 10 30 -30 -10 10 30 -30 -10 10 30];
%  DUC_LINEUP_param.NCO_ant34.Freq          =  [-30 -10 10 30 -30 -10 10 30 -30 -10 10 30 -30 -10 10 30];

 %DUC_LINEUP_param.NCO_ant12.Freq          =  [-30 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
 %DUC_LINEUP_param.NCO_ant12.Freq          =  [10 0 -20 0 0 0 0 0 0 0 0 0 0 0 0 0];
 
% DUC_LINEUP_param.NCO_ant12.Freq        =  [-30 -20 -10 -5 6 11 21 31 -29 -19 -9 -4 7 12 22 32]; 
% DUC_LINEUP_param.NCO_ant34.Freq        =  [-31 -21 -11 -6 5 10 20 30 -28 -18 -8 -3 6 11 21 31]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable CFR   0 - Disable / 1 - Enable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CFR_Enable  = 0;  % boolean 


 in_data = load('downlink_8c4t_lduc_data_in.mat');
 inputdata = in_data.data;
% %in_data = load('downlink_8c4t_lduc_st_data_in.mat');
% %inputdata = in_data.data_st;
 DUC_LINEUP_param.inputdata = inputdata;
% fvtool(inputdata,'fs',30.72e6);


 
% in_data = load('TC06_LTE20_30p72_0.mat');
% in_data = in_data.Hepta_Test_Vector_Data;
% real_data = in_data(1:2:end);
% imag_data = in_data(2:2:end);

% inputdata = complex(real_data,imag_data);
  
% DUC_LINEUP_param.inputdata=complex(real_data,imag_data);
%  fvtool(inputdata,'fs',30.72e6);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify PAPR Values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LCFR_PAPR = 6.5;  % PAPR Value for LCFR for Antenna 1,2,3 & 4 in dB format
%HCFR1_PAPR = 9;   % PAPR Value for HCFR for Antenna 1,2 in dB format
%HCFR2_PAPR = 9;   % PAPR Value for HCFR for Antenna 3,4 in dB format


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify ClipValue Values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 ClipValue0 = 0.2; %% ANT lcfr Clip vlaue in dB
 ClipValue1 = 0.2; %% ANT hcfr1 Clip vlaue in dB
 ClipValue2 = 0.2; %% ANT hcfr2 Clip vlaue in dB

% ClipValue0 = min(10^(LCFR_PAPR/20) * sqrt(mean(abs(lcfr_input.signals.values).^2)), 0.8);
% ClipValue1 = min(10^(HCFR1_PAPR/20) * sqrt(mean(abs(hcfr_input.signals.values).^2)), 0.8);
% ClipValue2 = min(10^(HCFR2_PAPR/20) * sqrt(mean(abs(hcfr_input.signals.values).^2)), 0.8);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DUC TEST_BENCH  %% Test Bench file should be as .mat file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%% SINGLE TONE INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ant1_file_data_vec=load('TC02_Singletone20_30p72_1.mat');  
% Ant2_file_data_vec=load('TC03_Singletone20_30p72_0.mat');  
% Ant3_file_data_vec=load('TC03_Singletone20_30p72_1.mat'); 
% Ant4_file_data_vec=load('TC01_Singletone20_30p72_0.mat'); 

%%%%%%%%% LTE INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ant1_file_data_vec=load('8c8t8r_tc06_lte20_30p72_0.mat');  
Ant2_file_data_vec=load('8c8t8r_tc06_lte20_30p72_0.mat');  
Ant3_file_data_vec=load('8c8t8r_tc06_lte20_30p72_0.mat'); 
Ant4_file_data_vec=load('8c8t8r_tc06_lte20_30p72_0.mat'); 


Ant1_file_data=Ant1_file_data_vec.Hepta_Test_Vector_Data;
Ant2_file_data=Ant2_file_data_vec.Hepta_Test_Vector_Data;
Ant3_file_data=Ant3_file_data_vec.Hepta_Test_Vector_Data;
Ant4_file_data=Ant4_file_data_vec.Hepta_Test_Vector_Data;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify How many simulation clock cycles to Run
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Test_Bench_Run_Time = 10000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Adjust the pipelining effort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DUC_LINEUP_param.ClockMargin      = 125;   %% in MHz         
DUC_LINEUP_param.ClockMargin_DPD  = 127;   %% in MHz 
DUC_LINEUP_param.ClockMargin_CFR  = 127;   %% in MHz 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% System Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format long;  
OccupiedBW = 0.9; % Proportion of LTE carrier filled with subcarriers

DUC_LINEUP_param.ChanCount        = 32;               % How many data channels
DUC_LINEUP_param.ClockRate        = 491.52;          % The system clock rate in MHz
DUC_LINEUP_param.SampleRate_5MHz  = 7.68;            % The data rate per channel in MSps (mega-samples per second)
DUC_LINEUP_param.SampleRate_10MHz = 15.36;           % The data rate per channel in MSps (mega-samples per second)
DUC_LINEUP_param.SampleRate_20MHz = 30.72;           % The data rate per channel in MSps (mega-samples per second)
DUC_LINEUP_param.Base_addr        = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data Type Specification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DUC_LINEUP_param.input_word_length      = 16;         % Input data: bit width
DUC_LINEUP_param.input_fraction_length  = 15;         % Input data: fraction width

DUC_LINEUP_param.output_word_length     = 16;         % Output data: bit width
DUC_LINEUP_param.output_fraction_length = 15;         % Output data: fraction width


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ModelIP FILTER CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Out12


%% Filter 1- channal filter
DUC_LINEUP_param.chan_filter.SampleRate            = DUC_LINEUP_param.SampleRate_20MHz;         % Input rate at filter1
DUC_LINEUP_param.chan_filter.FilterLength          = 87;                                        % Number of Taps is not doesnt depend on parameter- Filter Lengh. It inherits from Coefficient file.
DUC_LINEUP_param.chan_filter.coeff_word_length     = 16;                                        % filter1 coefficient: bit width
DUC_LINEUP_param.chan_filter.coeff_fraction_length = 15;                         
DUC_LINEUP_param.chan_filter.base_addr1             = DUC_LINEUP_param.Base_addr;                       
DUC_LINEUP_param.chan_filter.base_addr2             = DUC_LINEUP_param.chan_filter.base_addr1+64;
DUC_LINEUP_param.chan_filter.ChanCount              = DUC_LINEUP_param.ChanCount;


%% Filter 4 -  HB2 Filer4

DUC_LINEUP_param.HB_filt4.SampleRate            = DUC_LINEUP_param.SampleRate_20MHz;         % Input rate at filter4  - 30.72-- 4*7.68
DUC_LINEUP_param.HB_filt4.FilterLength          = 47;                          % Number of Taps is not doesnt depend on parameter- Filter Lengh. It inherits from Coefficient file.
DUC_LINEUP_param.HB_filt4.Interpolation         = 2;                           % Interpolation rate  
DUC_LINEUP_param.HB_filt4.coeff_word_length     = 16;                          % filter4 coefficient: bit width
DUC_LINEUP_param.HB_filt4.coeff_fraction_length = 15;                          % filter4 coefficient: fraction width 
DUC_LINEUP_param.HB_filt4.base_addr1             =  DUC_LINEUP_param.chan_filter.base_addr2 + 64;
DUC_LINEUP_param.HB_filt4.base_addr2             =  DUC_LINEUP_param.HB_filt4.base_addr1 + 64;
DUC_LINEUP_param.HB_filt4.ChanCount               = DUC_LINEUP_param.ChanCount;


%% Filter 5 -  HB2 Filer5

DUC_LINEUP_param.HB_filt5.SampleRate            = DUC_LINEUP_param.SampleRate_20MHz*2;         % Input rate at filter5  - -61.44- 2*30.72
DUC_LINEUP_param.HB_filt5.FilterLength          = 27;                          % Number of Taps is not doesnt depend on parameter- Filter Lengh. It inherits from Coefficient file.
DUC_LINEUP_param.HB_filt5.Interpolation         = 2;                           % Interpolation rate  
DUC_LINEUP_param.HB_filt5.coeff_word_length     = 16;                          % filter5 coefficient: bit width
DUC_LINEUP_param.HB_filt5.coeff_fraction_length = 15;                          % filter5 coefficient: fraction width 
DUC_LINEUP_param.HB_filt5.base_addr1             =  DUC_LINEUP_param.HB_filt4.base_addr2 + 64;
DUC_LINEUP_param.HB_filt5.base_addr2             =  DUC_LINEUP_param.HB_filt5.base_addr1 + 64;
DUC_LINEUP_param.HB_filt5.ChanCount              = DUC_LINEUP_param.ChanCount;

%% Filter 6 -  HB2 Filer6

DUC_LINEUP_param.HB_filt6.SampleRate            = DUC_LINEUP_param.SampleRate_20MHz*4;         % Input rate at filter5  -122.88 -4*30.72
DUC_LINEUP_param.HB_filt6.FilterLength          = 17;                          % Number of Taps is not doesnt depend on parameter- Filter Lengh. It inherits from Coefficient file.
DUC_LINEUP_param.HB_filt6.Interpolation         = 2;                           % Interpolation rate  
DUC_LINEUP_param.HB_filt6.coeff_word_length     = 16;                          % filter5 coefficient: bit width
DUC_LINEUP_param.HB_filt6.coeff_fraction_length = 15;                          % filter5 coefficient: fraction width 
DUC_LINEUP_param.HB_filt6.base_addr1             = DUC_LINEUP_param.HB_filt5.base_addr2  + 64;
DUC_LINEUP_param.HB_filt6.base_addr2             = DUC_LINEUP_param.HB_filt6.base_addr1  + 64;
DUC_LINEUP_param.HB_filt6.ChanCount             = DUC_LINEUP_param.ChanCount/16;
DUC_LINEUP_param.HB_filt6.Mult_factor           = [1 1];
DUC_LINEUP_param.HB_filt6.left_shift            = [1 1];

%% Filter 7 -  HB2 Filer7
DUC_LINEUP_param.HB_filt7.SampleRate            = DUC_LINEUP_param.SampleRate_20MHz*8;         % Input rate at filter5  -245.76 -8*30.72
DUC_LINEUP_param.HB_filt7.FilterLength          = 15;                          % Number of Taps is not doesnt depend on parameter- Filter Lengh. It inherits from Coefficient file.
DUC_LINEUP_param.HB_filt7.Interpolation         = 2;                           % Interpolation rate  
DUC_LINEUP_param.HB_filt7.coeff_word_length     = 16;                          % filter5 coefficient: bit width
DUC_LINEUP_param.HB_filt7.coeff_fraction_length = 15;                          % filter5 coefficient: fraction width 
DUC_LINEUP_param.HB_filt7.ChanCount             = DUC_LINEUP_param.ChanCount/16;
DUC_LINEUP_param.HB_filt7.Mult_factor           = [1 1];
DUC_LINEUP_param.HB_filt7.left_shift            = [1 1];
DUC_LINEUP_param.HB_filt7.base_addr1             = DUC_LINEUP_param.HB_filt6.base_addr2 + 64;
DUC_LINEUP_param.HB_filt7.base_addr2             = DUC_LINEUP_param.HB_filt7.base_addr1 + 64;

%% carrier NCO Ant 12
DUC_LINEUP_param.NCO.SampleRate            = DUC_LINEUP_param.SampleRate_20MHz*4;                        % output rate at NCO  - 122.88 -- 4*30.72
DUC_LINEUP_param.NCO.Data_type             = DUC_LINEUP_param.output_word_length;
DUC_LINEUP_param.NCO.scaling_value         = DUC_LINEUP_param.output_fraction_length;
DUC_LINEUP_param.NCO.Acumulater_bit_wid    = 24;                          
DUC_LINEUP_param.NCO_ant12.Freq_word       = ((DUC_LINEUP_param.NCO_ant12.Freq*2^DUC_LINEUP_param.NCO.Acumulater_bit_wid) / (DUC_LINEUP_param.NCO.SampleRate)) ;                          % Interpolation rate  
DUC_LINEUP_param.NCO_ant12.base_addr       = DUC_LINEUP_param.HB_filt7.base_addr2 + 16;
DUC_LINEUP_param.NCO_ant34.Freq_word       = ((DUC_LINEUP_param.NCO_ant34.Freq*2^DUC_LINEUP_param.NCO.Acumulater_bit_wid) / (DUC_LINEUP_param.NCO.SampleRate)) ;                          % Interpolation rate  
DUC_LINEUP_param.NCO_ant34.base_addr       = DUC_LINEUP_param.NCO_ant12.base_addr + 16;
DUC_LINEUP_param.NCO.latency               = 0;

%% complex mixer
DUC_LINEUP_param.CM.SampleRate            = DUC_LINEUP_param.SampleRate_20MHz*4;                              % output rate at CM  - 122.88 -- 4*30.72
DUC_LINEUP_param.CM.No_Of_Complex_chan    = DUC_LINEUP_param.ChanCount/2;
DUC_LINEUP_param.CM.No_Of_Complex_Freq    = DUC_LINEUP_param.ChanCount/2;


DUC_CM_multiplication_factor = 1;
DUC_CM_Number_of_bits_to_shift_left = 0;

DUC_CM_NCO_sync  = [0 0 0 0];
DUC_CM_NCO_phase = [0 0 0 0];

DUC_SUMMER_multiplication_factor = 1;
DUC_SUMMER_Number_of_bits_to_shift_left = [0 -1 -2 -3];

NCO1_Sync_addr = DUC_LINEUP_param.NCO_ant34.base_addr+16;
NCO2_Sync_addr = NCO1_Sync_addr+16;

Sum_shifter1_addr = NCO2_Sync_addr+4;
Sum_shifter1_init_value = 2;

Sum_shifter2_addr = Sum_shifter1_addr+1;
Sum_shifter2_init_value = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%  GENERATE/LOAD CO-EFF FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chanfilt_coeff = [ duc_config '/chanfilt_coeffs.txt'];
hb4_coeff      = [ duc_config '/hbint04_coeffs.txt'];
hb5_coeff      = [ duc_config '/hbint05_coeffs.txt'];
hb6_coeff      = [ duc_config '/hbint06_coeffs.txt'];
hb7_coeff      = [ duc_config '/hbint07_coeffs.txt'];

if(strcmp(duc_coeff,'generate')==1) 
    %% Channel Filter
    DUC_LINEUP_param.ChanFilt.FilterLength          = 86;                          % Number of Taps
    DUC_LINEUP_param.ChanFilt.Fpass                 = 20*OccupiedBW/SampleRate_20MHz;% passband 
    DUC_LINEUP_param.ChanFilt.Fstop                 = 20/SampleRate_20MHz;           % stopband 
    DUC_LINEUP_param.ChanFilt.Aripple               = 0.04;                        % passband ripple   
    fdes = fdesign.lowpass('N,Fp,Fst,Ap',DUC_LINEUP_param.ChanFilt.FilterLength,DUC_LINEUP_param.ChanFilt.Fpass,DUC_LINEUP_param.ChanFilt.Fstop,DUC_LINEUP_param.ChanFilt.Aripple);
    fdes = design(fdes,'equiripple','SystemObject',true);               % Equiripple 
    chanfilt_coeff=fdes.Numerator;
    DUC_LINEUP_param.chan_filter.coeffs(1,:) = fi(chanfilt_coeff',1,DUC_LINEUP_param.chan_filter.coeff_word_length,DUC_LINEUP_param.chan_filter.coeff_fraction_length ); 
    save('CFG_G/chanfilt_coeffs.txt','chanfilt_coeff' ,'-ASCII','-DOUBLE');

    %% HBint02 Filter
    DUC_LINEUP_param.HBint02.FilterLength           = 32;                          % Number of Taps
    DUC_LINEUP_param.HBint02.Ast                    = 90;                          % stopband attenuation    
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DUC_LINEUP_param.HBint02.FilterLength,DUC_LINEUP_param.HBint02.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);               % Equiripple 
    hb2_coeff=fdes.Numerator;
    DUC_LINEUP_param.HB_filt2.coeffs(1,:) = fi(hb2_coeff',1,DUC_LINEUP_param.HB_filt2.coeff_word_length,DUC_LINEUP_param.HB_filt2.coeff_fraction_length); 
    save('CFG_G/hbint02_coeffs.txt','hb2_coeff','-ASCII','-DOUBLE');

    %% HBint03 Filter
    DUC_LINEUP_param.HBint03.FilterLength           = 32;                          % Number of Taps
    DUC_LINEUP_param.HBint03.Ast                    = 90;                          % stopband attenuation    
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DUC_LINEUP_param.HBint03.FilterLength,DUC_LINEUP_param.HBint03.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);               % Equiripple 
    hb3_coeff=fdes.Numerator;
    DUC_LINEUP_param.HB_filt3.coeffs(1,:) = fi(hb3_coeff',1,DUC_LINEUP_param.HB_filt3.coeff_word_length,DUC_LINEUP_param.HB_filt3.coeff_fraction_length); 
    save('CFG_G/hbint03_coeffs.txt','hb3_coeff','-ASCII','-DOUBLE');

    %% HBint04 Filter
    DUC_LINEUP_param.HBint04.FilterLength          = 32;                          % Number of Taps
    DUC_LINEUP_param.HBint04.Ast                   = 90;                          % stopband attenuation  
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DUC_LINEUP_param.HBint04.FilterLength,DUC_LINEUP_param.HBint04.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);              % Equiripple 
    hb4_coeff=fdes.Numerator;
    DUC_LINEUP_param.HB_filt4.coeffs(1,:) = fi(hb4_coeff',1,DUC_LINEUP_param.HB_filt4.coeff_word_length,DUC_LINEUP_param.HB_filt4.coeff_fraction_length); 
    save('CFG_G/hbint04_coeffs.txt','hb4_coeff','-ASCII','-DOUBLE');

    %% HBint05 Filter
    DUC_LINEUP_param.HBint05.FilterLength          = 32;                          % Number of Taps    
    DUC_LINEUP_param.HBint05.Ast                   = 90;                          % stopband attenuation    
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DUC_LINEUP_param.HBint05.FilterLength,DUC_LINEUP_param.HBint05.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);              % Equiripple 
    hb5_coeff=fdes.Numerator;
    DUC_LINEUP_param.HB_filt5.coeffs(1,:) = fi(hb5_coeff',1,DUC_LINEUP_param.HB_filt5.coeff_word_length,DUC_LINEUP_param.HB_filt5.coeff_fraction_length); 
    save('CFG_G/hbint05_coeffs.txt','hb5_coeff','-ASCII','-DOUBLE');
    
    %% HBint06 Filter
    DUC_LINEUP_param.HBint06.FilterLength          = 16;                          % Number of Taps
    DUC_LINEUP_param.HBint06.Ast                   = 100;                          % stopband attenuation        
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DUC_LINEUP_param.HBint06.FilterLength,DUC_LINEUP_param.HBint06.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);              % Equiripple 
    hb6_coeff=fdes.Numerator;
    DUC_LINEUP_param.HB_filt6.coeffs(1,:) = fi(hb6_coeff',1,DUC_LINEUP_param.HB_filt6.coeff_word_length,DUC_LINEUP_param.HB_filt6.coeff_fraction_length); 
    save('CFG_G/hbint06_coeffs.txt','hb6_coeff','-ASCII','-DOUBLE');  

    %% HBint07 Filter
    DUC_LINEUP_param.HBint07.FilterLength          = 14;                          % Number of Taps
    DUC_LINEUP_param.HBint07.Ast                   = 100;                          % stopband attenuation        
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DUC_LINEUP_param.HBint07.FilterLength,DUC_LINEUP_param.HBint07.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);              % Equiripple 
    hb7_coeff=fdes.Numerator;
    DUC_LINEUP_param.HB_filt7.coeffs(1,:) = fi(hb7_coeff',1,DUC_LINEUP_param.HB_filt7.coeff_word_length,DUC_LINEUP_param.HB_filt7.coeff_fraction_length); 
    save('CFG_G/hbint07_coeffs.txt','hb7_coeff','-ASCII','-DOUBLE');  

   elseif(strcmp(duc_coeff,'load')==1) 
      
    DUC_LINEUP_param.chan_filter.coeffs(1,:)  =fi(load(chanfilt_coeff),1,DUC_LINEUP_param.chan_filter.coeff_word_length,DUC_LINEUP_param.chan_filter.coeff_fraction_length);
    DUC_LINEUP_param.HB_filt4.coeffs(1,:)     =fi(load(hb4_coeff),1,DUC_LINEUP_param.HB_filt4.coeff_word_length,DUC_LINEUP_param.HB_filt4.coeff_fraction_length);
    DUC_LINEUP_param.HB_filt5.coeffs(1,:)     =fi(load(hb5_coeff),1,DUC_LINEUP_param.HB_filt5.coeff_word_length,DUC_LINEUP_param.HB_filt5.coeff_fraction_length);
    DUC_LINEUP_param.HB_filt6.coeffs(1,:)     =fi(load(hb6_coeff),1,DUC_LINEUP_param.HB_filt6.coeff_word_length,DUC_LINEUP_param.HB_filt6.coeff_fraction_length);
    DUC_LINEUP_param.HB_filt7.coeffs(1,:)     =fi(load(hb7_coeff),1,DUC_LINEUP_param.HB_filt7.coeff_word_length,DUC_LINEUP_param.HB_filt7.coeff_fraction_length);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  CFR_CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %generate IQ-data
% addpath 8c8t8r_utilities
% addpath 8c8t8r_waveform_generation
% addpath 8c8t8r_waveform_generation/lte_dev/
% addpath 8c8t8r_waveform_generation/lte_dev/map/
% addpath 8c8t8r_waveform_generation/lte_dev/map/Quantiser

%%%%%%%%%%%%%%%%% Configuration 0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clock rate and sample rate.  
clock_rate = 491.52;
% Folding Factor and Sample Rate 
sym_rate = 30.72;
sample_rate = 491.52;


% Generating Channel/valid signals:
%cSig = [0:Folding-1];
%vSig = 1;

%%% NCO settings
fIF1 = -10;
fIF2 = 10;

% LTE_64 = GenLteSrc(log2(64),sample_rate/sym_rate); % 64 QAM LTE20 Signal @ sample_rate/sym_rate times oversampling
% LTE_16 = GenLteSrc(log2(16),sample_rate/sym_rate); % 16 QAM LTE20 Signal @ sample_rate/sym_rate times oversampling
% LTE_4 = GenLteSrc(log2(4),sample_rate/sym_rate);   % 4  QAM LTE20 Signal @ sample_rate/sym_rate times oversampling
% 
% % Setup input carriers
% n = [1:length(LTE_64)]';
% K = [.5, .5];
% cfr_input_f1 = K(1)*LTE_64 .* exp(1i*2*pi*fIF1*n/sample_rate);
% cfr_input_f2 = K(2)*LTE_16 .* exp(1i*2*pi*fIF2*n/sample_rate);
% LTE_tmp1 = cfr_input_f1 + cfr_input_f2; % Aggregate input carriers
%  
% cfr_input_f1 = K(1)*LTE_64 .* exp(1i*2*pi*fIF1*n/sample_rate);
% cfr_input_f2 = K(2)*LTE_4 .* exp(1i*2*pi*fIF2*n/sample_rate);
% LTE_tmp2 = cfr_input_f1 + cfr_input_f2; % Aggregate input carriers
% 
% cfr_input_f1 = K(1)*LTE_16 .* exp(1i*2*pi*fIF1*n/sample_rate);
% cfr_input_f2 = K(2)*LTE_4 .* exp(1i*2*pi*fIF2*n/sample_rate);
% LTE_tmp3 = cfr_input_f1 + cfr_input_f2; % Aggregate input carriers
% 
% switch Folding 
%     case 1        
%         LTE_tmp = [LTE_tmp1];
%     case 2 
%         LTE_tmp = [LTE_tmp1, LTE_tmp2];
%     case 4
%         LTE_tmp = [LTE_tmp1, LTE_tmp2, LTE_tmp3, zeros(length(LTE_tmp1),1)];
%     case 8
%         LTE_tmp = [LTE_tmp1, LTE_tmp2, LTE_tmp3, LTE_tmp1, LTE_tmp2, LTE_tmp3, LTE_tmp1, zeros(length(LTE_tmp1),1)];
% end;
% 
% LteInput = reshape(transpose(LTE_tmp),Folding*length(LTE_tmp1),1);
% cfr_input_24576 = 14.*LteInput;
 
% fixed parameters - compile time parameters
iq_width = 16;

% dut id unique identifier
% register's addresses
REG_dut_id_addr = 0;

cfr_cordic_gain = 1.8;
cfr_stages = 8;
cfr_xy_cord_bits = 18;
cfr_xy_cord_fractional_bits = 14;
cfr_angle_cord_bits = 16;
cfr_angle_cord_fractional_bits = 15;



% Individual Iteration Registers Offset
% The individual register address thus becomes
% REG_Iter_<n>_Base_Addr + REG_<name>
REG.Enable = 64;
REG.Threshold = 128;
REG.Scaling = 132;
REG.FirTap1 = 512;
REG.FirTap2 = 1024;
REG.FirTap3 = 2048;

cfr0_id = 8;
PulsExtention = 128;


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Iteration 0 Configurations
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Iter0_Param.BaseAddr      = Sum_shifter2_addr ;                   % processor interface start address
Iter0_Param.ClipVal       = ClipValue0 * cfr_cordic_gain; % initial clipping amplitude (re-programmable during run-time)
%Iter0_Param.ClipVal       = 0.15; % initial clipping amplitude (re-programmable during run-time)
Iter0_Param.Scaling       = 1.0;                     % initial Power Scaling value, between 0.0 to 1.99
%Iter0_Param.firCOEF       = cfr_config.pulse.sinc
Iter0_Param.Enable        = CFR_Enable;
Iter0_Param.pulseLen      = 64;
Iter0_Param.winLen        = Iter0_Param.pulseLen + 2*PulsExtention;

Iter1_Param.BaseAddr      = Iter0_Param.BaseAddr + REG.FirTap3 + 64 ;                   % processor interface start address
Iter1_Param.ClipVal       = ClipValue0 * cfr_cordic_gain; % initial clipping amplitude (re-programmable during run-time)
Iter1_Param.Scaling       = 1.0;                     % initial Power Scaling value, between 0.0 to 1.99
%Iter1_Param.firCOEF       = cfr_config.pulse.sinc
Iter1_Param.Enable        = CFR_Enable;
Iter1_Param.pulseLen      = 64;
Iter1_Param.winLen        = Iter1_Param.pulseLen + 2*PulsExtention;

Iter2_Param.BaseAddr      = Iter1_Param.BaseAddr + REG.FirTap3 + 64 ;                   % processor interface start address
Iter2_Param.ClipVal       = ClipValue0 * cfr_cordic_gain; % initial clipping amplitude (re-programmable during run-time)
Iter2_Param.Scaling       = 1.0;                     % initial Power Scaling value, between 0.0 to 1.99
%Iter2_Param.firCOEF       = cfr_config.pulse.sinc
Iter2_Param.Enable        = CFR_Enable;
Iter2_Param.pulseLen      = 64;
Iter2_Param.winLen        = Iter2_Param.pulseLen + 2*PulsExtention;

Iter3_Param.BaseAddr      = Iter2_Param.BaseAddr + REG.FirTap3 + 64;                   % processor interface start address
Iter3_Param.ClipVal       = ClipValue0 * cfr_cordic_gain; % initial clipping amplitude (re-programmable during run-time)
Iter3_Param.Scaling       = 1.0;                     % initial Power Scaling value, between 0.0 to 1.99
%Iter3_Param.firCOEF       = cfr_config.pulse.sinc
Iter3_Param.Enable        = CFR_Enable;
Iter3_Param.pulseLen      = 64;
Iter3_Param.winLen        = Iter3_Param.pulseLen + 2*PulsExtention;

cfr_Params_Ant1           = Iter0_Param;
cfr_Params_Ant2           = Iter1_Param;
cfr_Params_Ant3           = Iter2_Param;
cfr_Params_Ant4           = Iter3_Param;

%w = transpose( kaiser(2*PulsExtention,8) );        
w = transpose( hanning(2*PulsExtention,'symmetric') );
win_enable = 1;
win = [w(1:PulsExtention) ones(1,Iter0_Param.pulseLen) w(PulsExtention+1:end)];


 %%%%%%%%%%%%%%%%%% DPD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Clock rate and sample rate.  
if exist('OverrideClockRate', 'var')
    clock_rate_dpd = OverrideClockRate;
else
    clock_rate_dpd = 491.52; 
end


load('downlink_8c4t_luts2.mat')

sample_rate_dpd = clock_rate_dpd;

%%
cordic_gain = 1.8;
WordLength = 16;
FractionLength = 15;
OutputScalingFactor = 2^-FractionLength;
LUT_OutputScalingFactor = 2^-(FractionLength - 5);

stages = 10; %ceil(log2(size(LutContent,1))+2);
xy_angle_bits = 16;
xy_angle_fract_bits = 15;
xy_bits = 18;
xy_fract_bits = 14;

fxp_coeff_width = 16;

% dut id unique identifier
predistort0_id = 6;

dpd1_StartAddress1= Iter3_Param.BaseAddr + REG.FirTap3 ;
dpd1_StartAddress2 = dpd1_StartAddress1 + 1;
dpd1_StartAddress3 = dpd1_StartAddress2 + 1;
dpd1_StartAddress4 = dpd1_StartAddress3 + 1;
dpd1_StartAddress5 = dpd1_StartAddress4 + 1;
dpd1_StartAddress6 = dpd1_StartAddress5 + 1;
dpd1_StartAddress7 = dpd1_StartAddress6 + 1;
dpd1_StartAddress8 = dpd1_StartAddress7 + 1;
dpd1_StartAddress9 = dpd1_StartAddress8 + 1;
dpd1_StartAddress10 = dpd1_StartAddress9 + 1;
dpd1_StartAddress11 = dpd1_StartAddress10 + 1;
dpd1_StartAddress12 = dpd1_StartAddress11 + 1;


dpd2_StartAddress1= dpd1_StartAddress12 + 1;
dpd2_StartAddress2 = dpd2_StartAddress1 + 1;
dpd2_StartAddress3 = dpd2_StartAddress2 + 1;
dpd2_StartAddress4 = dpd2_StartAddress3 + 1;
dpd2_StartAddress5 = dpd2_StartAddress4 + 1;
dpd2_StartAddress6 = dpd2_StartAddress5 + 1;
dpd2_StartAddress7 = dpd2_StartAddress6 + 1;
dpd2_StartAddress8 = dpd2_StartAddress7 + 1;
dpd2_StartAddress9 = dpd2_StartAddress8 + 1;
dpd2_StartAddress10 = dpd2_StartAddress9 + 1;
dpd2_StartAddress11 = dpd2_StartAddress10 + 1;
dpd2_StartAddress12 = dpd2_StartAddress11 + 1;


dpd3_StartAddress1  = dpd2_StartAddress12 + 1;
dpd3_StartAddress2  = dpd3_StartAddress1 + 1;
dpd3_StartAddress3  = dpd3_StartAddress2 + 1;
dpd3_StartAddress4  = dpd3_StartAddress3 + 1;
dpd3_StartAddress5  = dpd3_StartAddress4 + 1;
dpd3_StartAddress6  = dpd3_StartAddress5 + 1;
dpd3_StartAddress7  = dpd3_StartAddress6 + 1;
dpd3_StartAddress8  = dpd3_StartAddress7 + 1;
dpd3_StartAddress9  = dpd3_StartAddress8 + 1;
dpd3_StartAddress10 = dpd3_StartAddress9 + 1;
dpd3_StartAddress11 = dpd3_StartAddress10 + 1;
dpd3_StartAddress12 = dpd3_StartAddress11 + 1;

dpd4_StartAddress1  = dpd3_StartAddress12 + 1;
dpd4_StartAddress2  = dpd4_StartAddress1 + 1;
dpd4_StartAddress3  = dpd4_StartAddress2 + 1;
dpd4_StartAddress4  = dpd4_StartAddress3 + 1;
dpd4_StartAddress5  = dpd4_StartAddress4 + 1;
dpd4_StartAddress6  = dpd4_StartAddress5 + 1;
dpd4_StartAddress7  = dpd4_StartAddress6 + 1;
dpd4_StartAddress8  = dpd4_StartAddress7 + 1;
dpd4_StartAddress9  = dpd4_StartAddress8 + 1;
dpd4_StartAddress10 = dpd4_StartAddress9 + 1;
dpd4_StartAddress11 = dpd4_StartAddress10 + 1;
dpd4_StartAddress12 = dpd4_StartAddress11 + 1;

dpd1_enable = 0;
dpd2_enable = 0;
dpd3_enable = 0;
dpd4_enable = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


DUC_LINEUP_param.SampleTime  = 1;                    % One unit in Simulink simulation is one clock cycle 
DUC_LINEUP_param.endTime     = Test_Bench_Run_Time;                 % How many simulation clock cycles
DUC_LINEUP_param.ContiguousValidFrames   = 1;        % Create a sequence of valid and invali frames of stimulus data in the Channelizer block
DUC_LINEUP_param.ContiguousInvalidFrames = 1; 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEST_BENCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

real_data1 = Ant1_file_data(1:2:end);
imag_data1 = Ant1_file_data(2:2:end);
%fvtool(complex(real_data1,imag_data1),'fs',30.72e6);
real_data2 = Ant2_file_data(1:2:end);
imag_data2 = Ant2_file_data(2:2:end);
%fvtool(complex(real_data2,imag_data2),'fs',30.72e6);
real_data3 = Ant3_file_data(1:2:end);
imag_data3 = Ant3_file_data(2:2:end);
%fvtool(complex(real_data3,imag_data3),'fs',30.72e6);
real_data4 = Ant4_file_data(1:2:end);
imag_data4 = Ant4_file_data(2:2:end);
%fvtool(complex(real_data4,imag_data4),'fs',30.72e6);

zero_data = zeros(1,length(Ant1_file_data)/2);


% DUC_LINEUP_param.inputdata_A1xC1(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC1(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC2(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC2(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC3(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC3(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC4(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC4(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC5(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC5(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC6(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC6(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC7(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC7(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC8(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A1xC8(2,:) = zero_data;
% 
% DUC_LINEUP_param.inputdata_A2xC1(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC1(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC2(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC2(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC3(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC3(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC4(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC4(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC5(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC5(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC6(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC6(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC7(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC7(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC8(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A2xC8(2,:) = zero_data;

% DUC_LINEUP_param.inputdata_A3xC1(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC1(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC2(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC2(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC3(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC3(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC4(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC4(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC5(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC5(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC6(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC6(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC7(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC7(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC8(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A3xC8(2,:) = zero_data;
% 
% DUC_LINEUP_param.inputdata_A4xC1(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC1(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC2(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC2(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC3(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC3(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC4(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC4(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC5(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC5(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC6(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC6(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC7(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC7(2,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC8(1,:) = zero_data;
% DUC_LINEUP_param.inputdata_A4xC8(2,:) = zero_data;


% 
% DUC_LINEUP_param.inputdata_A1xC1 = imag_data1_quant*2^16+real_data1_quant;
% DUC_LINEUP_param.inputdata_A1xC2 = imag_data1_quant*2^16+real_data1_quant;
% DUC_LINEUP_param.inputdata_A1xC3 = imag_data1_quant*2^16+real_data1_quant;
% DUC_LINEUP_param.inputdata_A1xC4 = imag_data1_quant*2^16+real_data1_quant;
% DUC_LINEUP_param.inputdata_A1xC5 = imag_data1_quant*2^16+real_data1_quant;
% DUC_LINEUP_param.inputdata_A1xC6 = imag_data1_quant*2^16+real_data1_quant;
% DUC_LINEUP_param.inputdata_A1xC7 = imag_data1_quant*2^16+real_data1_quant;
% DUC_LINEUP_param.inputdata_A1xC8 = imag_data1_quant*2^16+real_data1_quant;
% 
% DUC_LINEUP_param.inputdata_A2xC1 = imag_data2_quant*2^16+real_data2_quant;
% DUC_LINEUP_param.inputdata_A2xC2 = imag_data2_quant*2^16+real_data2_quant;
% DUC_LINEUP_param.inputdata_A2xC3 = imag_data2_quant*2^16+real_data2_quant;
% DUC_LINEUP_param.inputdata_A2xC4 = imag_data2_quant*2^16+real_data2_quant;
% DUC_LINEUP_param.inputdata_A2xC5 = imag_data2_quant*2^16+real_data2_quant;
% DUC_LINEUP_param.inputdata_A2xC6 = imag_data2_quant*2^16+real_data2_quant;
% DUC_LINEUP_param.inputdata_A2xC7 = imag_data2_quant*2^16+real_data2_quant;
% DUC_LINEUP_param.inputdata_A2xC8 = imag_data2_quant*2^16+real_data2_quant;
% 
% DUC_LINEUP_param.inputdata_A3xC1 = imag_data3_quant*2^16+real_data3_quant;
% DUC_LINEUP_param.inputdata_A3xC2 = imag_data3_quant*2^16+real_data3_quant;
% DUC_LINEUP_param.inputdata_A3xC3 = imag_data3_quant*2^16+real_data3_quant;
% DUC_LINEUP_param.inputdata_A3xC4 = imag_data3_quant*2^16+real_data3_quant;
% DUC_LINEUP_param.inputdata_A3xC5 = imag_data3_quant*2^16+real_data3_quant;
% DUC_LINEUP_param.inputdata_A3xC6 = imag_data3_quant*2^16+real_data3_quant;
% DUC_LINEUP_param.inputdata_A3xC7 = imag_data3_quant*2^16+real_data3_quant;
% DUC_LINEUP_param.inputdata_A3xC8 = imag_data3_quant*2^16+real_data3_quant;
% 
% DUC_LINEUP_param.inputdata_A4xC1 = imag_data4_quant*2^16+real_data4_quant;
% DUC_LINEUP_param.inputdata_A4xC2 = imag_data4_quant*2^16+real_data4_quant;
% DUC_LINEUP_param.inputdata_A4xC3 = imag_data4_quant*2^16+real_data4_quant;
% DUC_LINEUP_param.inputdata_A4xC4 = imag_data4_quant*2^16+real_data4_quant;
% DUC_LINEUP_param.inputdata_A4xC5 = imag_data4_quant*2^16+real_data4_quant;
% DUC_LINEUP_param.inputdata_A4xC6 = imag_data4_quant*2^16+real_data4_quant;
% DUC_LINEUP_param.inputdata_A4xC7 = imag_data4_quant*2^16+real_data4_quant;
% DUC_LINEUP_param.inputdata_A4xC8 = imag_data4_quant*2^16+real_data4_quant;

% DUC_LINEUP_param.inputdata_A1xC1(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC1(2,:) = imag_data1;
% DUC_LINEUP_param.inputdata_A1xC2(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC2(2,:) = imag_data1;
% DUC_LINEUP_param.inputdata_A1xC3(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC3(2,:) = imag_data1;
% DUC_LINEUP_param.inputdata_A1xC4(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC4(2,:) = imag_data1;
% DUC_LINEUP_param.inputdata_A1xC5(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC5(2,:) = imag_data1;
% DUC_LINEUP_param.inputdata_A1xC6(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC6(2,:) = imag_data1;
% DUC_LINEUP_param.inputdata_A1xC7(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC7(2,:) = imag_data1;
% DUC_LINEUP_param.inputdata_A1xC8(1,:) = real_data1;
% DUC_LINEUP_param.inputdata_A1xC8(2,:) = imag_data1;
% 
% DUC_LINEUP_param.inputdata_A2xC1(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC1(2,:) = imag_data2;
% DUC_LINEUP_param.inputdata_A2xC2(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC2(2,:) = imag_data2;
% DUC_LINEUP_param.inputdata_A2xC3(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC3(2,:) = imag_data2;
% DUC_LINEUP_param.inputdata_A2xC4(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC4(2,:) = imag_data2;
% DUC_LINEUP_param.inputdata_A2xC5(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC5(2,:) = imag_data2;
% DUC_LINEUP_param.inputdata_A2xC6(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC6(2,:) = imag_data2;
% DUC_LINEUP_param.inputdata_A2xC7(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC7(2,:) = imag_data2;
% DUC_LINEUP_param.inputdata_A2xC8(1,:) = real_data2;
% DUC_LINEUP_param.inputdata_A2xC8(2,:) = imag_data2;

% DUC_LINEUP_param.inputdata_A3xC1(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC1(2,:) = imag_data3;
% DUC_LINEUP_param.inputdata_A3xC2(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC2(2,:) = imag_data3;
% DUC_LINEUP_param.inputdata_A3xC3(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC3(2,:) = imag_data3;
% DUC_LINEUP_param.inputdata_A3xC4(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC4(2,:) = imag_data3;
% DUC_LINEUP_param.inputdata_A3xC5(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC5(2,:) = imag_data3;
% DUC_LINEUP_param.inputdata_A3xC6(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC6(2,:) = imag_data3;
% DUC_LINEUP_param.inputdata_A3xC7(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC7(2,:) = imag_data3;
% DUC_LINEUP_param.inputdata_A3xC8(1,:) = real_data3;
% DUC_LINEUP_param.inputdata_A3xC8(2,:) = imag_data3;

% DUC_LINEUP_param.inputdata_A4xC1(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC1(2,:) = imag_data4;
% DUC_LINEUP_param.inputdata_A4xC2(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC2(2,:) = imag_data4;
% DUC_LINEUP_param.inputdata_A4xC3(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC3(2,:) = imag_data4;
% DUC_LINEUP_param.inputdata_A4xC4(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC4(2,:) = imag_data4;
% DUC_LINEUP_param.inputdata_A4xC5(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC5(2,:) = imag_data4;
% DUC_LINEUP_param.inputdata_A4xC6(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC6(2,:) = imag_data4;
% DUC_LINEUP_param.inputdata_A4xC7(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC7(2,:) = imag_data4;
% DUC_LINEUP_param.inputdata_A4xC8(1,:) = real_data4;
% DUC_LINEUP_param.inputdata_A4xC8(2,:) = imag_data4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TEST VECTOR GENERATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% A1xC1 = load('TC03_Singletone20_30p72_0.mat');
% A1xC2 = load('TC02_Singletone20_30p72_0.mat');
% A1xC3 = load('TC02_Singletone20_30p72_1.mat');
% A1xC4 = load('TC03_Singletone20_30p72_1.mat');
% 
% A1xC5 = load('TC03_Singletone20_30p72_0.mat');
% A1xC6 = load('TC02_Singletone20_30p72_0.mat');
% A1xC7 = load('TC02_Singletone20_30p72_1.mat');
% A1xC8 = load('TC03_Singletone20_30p72_1.mat');


% A2xC1 = load('TC02_Singletone20_30p72_0.mat');
% A2xC2 = load('TC02_Singletone20_30p72_1.mat');
% A2xC3 = load('TC03_Singletone20_30p72_1.mat');
% A2xC4 = load('TC03_Singletone20_30p72_0.mat');
% A2xC5 = load('TC02_Singletone20_30p72_0.mat');
% A2xC6 = load('TC02_Singletone20_30p72_1.mat');
% A2xC7 = load('TC03_Singletone20_30p72_1.mat');
% A2xC8 = load('TC03_Singletone20_30p72_0.mat');
% 
% A3xC1 = load('TC02_Singletone20_30p72_1.mat');
% A3xC2 = load('TC03_Singletone20_30p72_1.mat');
% A3xC3 = load('TC03_Singletone20_30p72_0.mat');
% A3xC4 = load('TC02_Singletone20_30p72_0.mat');
% A3xC5 = load('TC02_Singletone20_30p72_1.mat');
% A3xC6 = load('TC03_Singletone20_30p72_1.mat');
% A3xC7 = load('TC03_Singletone20_30p72_0.mat');
% A3xC8 = load('TC02_Singletone20_30p72_0.mat');
% 
% A4xC1 = load('TC03_Singletone20_30p72_1.mat');
% A4xC2 = load('TC03_Singletone20_30p72_0.mat');
% A4xC3 = load('TC02_Singletone20_30p72_0.mat');
% A4xC4 = load('TC02_Singletone20_30p72_1.mat');
% A4xC5 = load('TC03_Singletone20_30p72_1.mat');
% A4xC6 = load('TC03_Singletone20_30p72_0.mat');
% A4xC7 = load('TC02_Singletone20_30p72_0.mat');
% A4xC8 = load('TC02_Singletone20_30p72_1.mat');

% A1xC1 = A1xC1.Hepta_Test_Vector_Data';
% A1xC2 = A1xC2.Hepta_Test_Vector_Data';
% A1xC3 = A1xC3.Hepta_Test_Vector_Data';
% A1xC4 = A1xC4.Hepta_Test_Vector_Data';
% A1xC5 = A1xC5.Hepta_Test_Vector_Data';
% A1xC6 = A1xC6.Hepta_Test_Vector_Data';
% A1xC7 = A1xC7.Hepta_Test_Vector_Data';
% A1xC8 = A1xC8.Hepta_Test_Vector_Data';

% A2xC1 = A2xC1.Hepta_Test_Vector_Data';
% A2xC2 = A2xC2.Hepta_Test_Vector_Data';
% A2xC3 = A2xC3.Hepta_Test_Vector_Data';
% A2xC4 = A2xC4.Hepta_Test_Vector_Data';
% A2xC5 = A2xC5.Hepta_Test_Vector_Data';
% A2xC6 = A2xC6.Hepta_Test_Vector_Data';
% A2xC7 = A2xC7.Hepta_Test_Vector_Data';
% A2xC8 = A2xC8.Hepta_Test_Vector_Data';
% 
% A3xC1 = A3xC1.Hepta_Test_Vector_Data';
% A3xC2 = A3xC2.Hepta_Test_Vector_Data';
% A3xC3 = A3xC3.Hepta_Test_Vector_Data';
% A3xC4 = A3xC4.Hepta_Test_Vector_Data';
% A3xC5 = A3xC5.Hepta_Test_Vector_Data';
% A3xC6 = A3xC6.Hepta_Test_Vector_Data';
% A3xC7 = A3xC7.Hepta_Test_Vector_Data';
% A3xC8 = A3xC8.Hepta_Test_Vector_Data';
% 
% A4xC1 = A4xC1.Hepta_Test_Vector_Data';
% A4xC2 = A4xC2.Hepta_Test_Vector_Data';
% A4xC3 = A4xC3.Hepta_Test_Vector_Data';
% A4xC4 = A4xC4.Hepta_Test_Vector_Data';
% A4xC5 = A4xC5.Hepta_Test_Vector_Data';
% A4xC6 = A4xC6.Hepta_Test_Vector_Data';
% A4xC7 = A4xC7.Hepta_Test_Vector_Data';
% A4xC8 = A4xC8.Hepta_Test_Vector_Data';


%  DUC_LINEUP_param.inputdata_A1xC1 = complex(A1xC1(1:2:(end/2)),A1xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A1xC2 = complex(A1xC2(1:2:(end/2)),A1xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A1xC3 = complex(A1xC3(1:2:(end/2)),A1xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A1xC4 = complex(A1xC4(1:2:(end/2)),A1xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A1xC5 = complex(A1xC5(1:2:(end/2)),A1xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A1xC6 = complex(A1xC6(1:2:(end/2)),A1xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A1xC7 = complex(A1xC7(1:2:(end/2)),A1xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A1xC8 = complex(A1xC8(1:2:(end/2)),A1xC8(2:2:(end/2)));
%  
%  
%  DUC_LINEUP_param.inputdata_A2xC1 = complex(A2xC1(1:2:(end/2)),A2xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A2xC2 = complex(A2xC2(1:2:(end/2)),A2xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A2xC3 = complex(A2xC3(1:2:(end/2)),A2xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A2xC4 = complex(A2xC4(1:2:(end/2)),A2xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A2xC5 = complex(A2xC5(1:2:(end/2)),A2xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A2xC6 = complex(A2xC6(1:2:(end/2)),A2xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A2xC7 = complex(A2xC7(1:2:(end/2)),A2xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A2xC8 = complex(A2xC8(1:2:(end/2)),A2xC8(2:2:(end/2)));
%  
%  DUC_LINEUP_param.inputdata_A3xC1 = complex(A3xC1(1:2:(end/2)),A3xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A3xC2 = complex(A3xC2(1:2:(end/2)),A3xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A3xC3 = complex(A3xC3(1:2:(end/2)),A3xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A3xC4 = complex(A3xC4(1:2:(end/2)),A3xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A3xC5 = complex(A3xC5(1:2:(end/2)),A3xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A3xC6 = complex(A3xC6(1:2:(end/2)),A3xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A3xC7 = complex(A3xC7(1:2:(end/2)),A3xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A3xC8 = complex(A3xC8(1:2:(end/2)),A3xC8(2:2:(end/2)));
%  
%  DUC_LINEUP_param.inputdata_A4xC1 = complex(A4xC1(1:2:(end/2)),A4xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A4xC2 = complex(A4xC2(1:2:(end/2)),A4xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A4xC3 = complex(A4xC3(1:2:(end/2)),A4xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A4xC4 = complex(A4xC4(1:2:(end/2)),A4xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A4xC5 = complex(A4xC5(1:2:(end/2)),A4xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A4xC6 = complex(A4xC6(1:2:(end/2)),A4xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A4xC7 = complex(A4xC7(1:2:(end/2)),A4xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A4xC8 = complex(A4xC8(1:2:(end/2)),A4xC8(2:2:(end/2)));
 
%  inputdata_length = 16 * length(DUC_LINEUP_param.inputdata_A1xC1);
%  
%  DUC_LINEUP_param.inputdata_A12 = zeros(1,inputdata_length);
%  DUC_LINEUP_param.inputdata_A34 = zeros(1,inputdata_length);
 
  
%  DUC_LINEUP_param.inputdata_A12(1:16:end) = complex(A1xC1(1:2:(end/2)),A1xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(2:16:end) = complex(A1xC2(1:2:(end/2)),A1xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(3:16:end) = complex(A1xC3(1:2:(end/2)),A1xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(4:16:end) = complex(A1xC4(1:2:(end/2)),A1xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(5:16:end) = complex(A1xC5(1:2:(end/2)),A1xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(6:16:end) = complex(A1xC6(1:2:(end/2)),A1xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(7:16:end) = complex(A1xC7(1:2:(end/2)),A1xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(8:16:end) = complex(A1xC8(1:2:(end/2)),A1xC8(2:2:(end/2)));
%  
%  DUC_LINEUP_param.inputdata_A12(9:16:end)  = complex(A2xC1(1:2:(end/2)),A2xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(10:16:end) = complex(A2xC2(1:2:(end/2)),A2xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(11:16:end) = complex(A2xC3(1:2:(end/2)),A2xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(12:16:end) = complex(A2xC4(1:2:(end/2)),A2xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(13:16:end) = complex(A2xC5(1:2:(end/2)),A2xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(14:16:end) = complex(A2xC6(1:2:(end/2)),A2xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(15:16:end) = complex(A2xC7(1:2:(end/2)),A2xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A12(16:16:end) = complex(A2xC8(1:2:(end/2)),A2xC8(2:2:(end/2)));
%  
%  DUC_LINEUP_param.inputdata_A34(1:16:end) = complex(A3xC1(1:2:(end/2)),A3xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(2:16:end) = complex(A3xC2(1:2:(end/2)),A3xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(3:16:end) = complex(A3xC3(1:2:(end/2)),A3xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(4:16:end) = complex(A3xC4(1:2:(end/2)),A3xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(5:16:end) = complex(A3xC5(1:2:(end/2)),A3xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(6:16:end) = complex(A3xC6(1:2:(end/2)),A3xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(7:16:end) = complex(A3xC7(1:2:(end/2)),A3xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(8:16:end) = complex(A3xC8(1:2:(end/2)),A3xC8(2:2:(end/2)));
 
%  DUC_LINEUP_param.inputdata_A34(9:16:end)  = complex(A4xC1(1:2:(end/2)),A4xC1(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(10:16:end) = complex(A4xC2(1:2:(end/2)),A4xC2(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(11:16:end) = complex(A4xC3(1:2:(end/2)),A4xC3(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(12:16:end) = complex(A4xC4(1:2:(end/2)),A4xC4(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(13:16:end) = complex(A4xC5(1:2:(end/2)),A4xC5(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(14:16:end) = complex(A4xC6(1:2:(end/2)),A4xC6(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(15:16:end) = complex(A4xC7(1:2:(end/2)),A4xC7(2:2:(end/2)));
%  DUC_LINEUP_param.inputdata_A34(16:16:end) = complex(A4xC8(1:2:(end/2)),A4xC8(2:2:(end/2)));
%  
%  inputdata_34 = DUC_LINEUP_param.inputdata_A34;
%  inputdata_12 = DUC_LINEUP_param.inputdata_A12;
%  
%  fvtool(inputdata_12(1:16:end),'fs',30.72e6);
%  fvtool(inputdata_34(1:16:end),'fs',30.72e6);

 
 
%% ********************************** STEP TEST *********************************************

DUC_LINEUP_param.inputdata_A1xC1 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A1xC2 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A1xC3 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A1xC4 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A1xC5 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A1xC6 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A1xC7 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A1xC8 = zeros(1,153600)';
% 
DUC_LINEUP_param.inputdata_A2xC1 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A2xC2 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A2xC3 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A2xC4 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A2xC5 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A2xC6 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A2xC7 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A2xC8 = zeros(1,153600)';


DUC_LINEUP_param.inputdata_A3xC1 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A3xC2 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A3xC3 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A3xC4 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A3xC5 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A3xC6 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A3xC7 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A3xC8 = zeros(1,153600)';

DUC_LINEUP_param.inputdata_A4xC1 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A4xC2 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A4xC3 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A4xC4 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A4xC5 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A4xC6 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A4xC7 = zeros(1,153600)';
DUC_LINEUP_param.inputdata_A4xC8 = zeros(1,153600)';



DUC_LINEUP_param.inputdata_A1xC1(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A1xC2(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A1xC3(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A1xC4(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A1xC5(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A1xC6(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A1xC7(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A1xC8(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);

DUC_LINEUP_param.inputdata_A2xC1(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A2xC2(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A2xC3(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A2xC4(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A2xC5(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A2xC6(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A2xC7(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A2xC8(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);

DUC_LINEUP_param.inputdata_A3xC1(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A3xC2(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A3xC3(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A3xC4(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A3xC5(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A3xC6(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A3xC7(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A3xC8(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);

DUC_LINEUP_param.inputdata_A4xC1(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A4xC2(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A4xC3(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A4xC4(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A4xC5(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A4xC6(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A4xC7(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);
DUC_LINEUP_param.inputdata_A4xC8(10:DUC_LINEUP_param.endTime) = complex(0.9,0.9);

inputdata_length = 16 * length(DUC_LINEUP_param.inputdata_A1xC1);
  
DUC_LINEUP_param.inputdata_A12 = zeros(1,inputdata_length)';
DUC_LINEUP_param.inputdata_A34 = zeros(1,inputdata_length)';

DUC_LINEUP_param.inputdata_A12(1:16:end) = DUC_LINEUP_param.inputdata_A1xC1;
DUC_LINEUP_param.inputdata_A12(2:16:end) = DUC_LINEUP_param.inputdata_A1xC2;
DUC_LINEUP_param.inputdata_A12(3:16:end) = DUC_LINEUP_param.inputdata_A1xC3;
DUC_LINEUP_param.inputdata_A12(4:16:end) = DUC_LINEUP_param.inputdata_A1xC4;
DUC_LINEUP_param.inputdata_A12(5:16:end) = DUC_LINEUP_param.inputdata_A1xC5;
DUC_LINEUP_param.inputdata_A12(6:16:end) = DUC_LINEUP_param.inputdata_A1xC6;
DUC_LINEUP_param.inputdata_A12(7:16:end) = DUC_LINEUP_param.inputdata_A1xC7;
DUC_LINEUP_param.inputdata_A12(8:16:end) = DUC_LINEUP_param.inputdata_A1xC8;

DUC_LINEUP_param.inputdata_A12(9:16:end)  = DUC_LINEUP_param.inputdata_A2xC1;
DUC_LINEUP_param.inputdata_A12(10:16:end) = DUC_LINEUP_param.inputdata_A2xC2;
DUC_LINEUP_param.inputdata_A12(11:16:end) = DUC_LINEUP_param.inputdata_A2xC3;
DUC_LINEUP_param.inputdata_A12(12:16:end) = DUC_LINEUP_param.inputdata_A2xC4;
DUC_LINEUP_param.inputdata_A12(13:16:end) = DUC_LINEUP_param.inputdata_A2xC5;
DUC_LINEUP_param.inputdata_A12(14:16:end) = DUC_LINEUP_param.inputdata_A2xC6;
DUC_LINEUP_param.inputdata_A12(15:16:end) = DUC_LINEUP_param.inputdata_A2xC7;
DUC_LINEUP_param.inputdata_A12(16:16:end) = DUC_LINEUP_param.inputdata_A2xC8;

DUC_LINEUP_param.inputdata_A34(1:16:end) = DUC_LINEUP_param.inputdata_A3xC1;
DUC_LINEUP_param.inputdata_A34(2:16:end) = DUC_LINEUP_param.inputdata_A3xC2;
DUC_LINEUP_param.inputdata_A34(3:16:end) = DUC_LINEUP_param.inputdata_A3xC3;
DUC_LINEUP_param.inputdata_A34(4:16:end) = DUC_LINEUP_param.inputdata_A3xC4;
DUC_LINEUP_param.inputdata_A34(5:16:end) = DUC_LINEUP_param.inputdata_A3xC5;
DUC_LINEUP_param.inputdata_A34(6:16:end) = DUC_LINEUP_param.inputdata_A3xC6;
DUC_LINEUP_param.inputdata_A34(7:16:end) = DUC_LINEUP_param.inputdata_A3xC7;
DUC_LINEUP_param.inputdata_A34(8:16:end) = DUC_LINEUP_param.inputdata_A3xC8;

DUC_LINEUP_param.inputdata_A34(9:16:end)  = DUC_LINEUP_param.inputdata_A4xC1;
DUC_LINEUP_param.inputdata_A34(10:16:end) = DUC_LINEUP_param.inputdata_A4xC2;
DUC_LINEUP_param.inputdata_A34(11:16:end) = DUC_LINEUP_param.inputdata_A4xC3;
DUC_LINEUP_param.inputdata_A34(12:16:end) = DUC_LINEUP_param.inputdata_A4xC4;
DUC_LINEUP_param.inputdata_A34(13:16:end) = DUC_LINEUP_param.inputdata_A4xC5;
DUC_LINEUP_param.inputdata_A34(14:16:end) = DUC_LINEUP_param.inputdata_A4xC6;
DUC_LINEUP_param.inputdata_A34(15:16:end) = DUC_LINEUP_param.inputdata_A4xC7;
DUC_LINEUP_param.inputdata_A34(16:16:end) = DUC_LINEUP_param.inputdata_A4xC8;

 inputdata_34 = DUC_LINEUP_param.inputdata_A34;
 inputdata_12 = DUC_LINEUP_param.inputdata_A12;
%  
  fvtool(inputdata_12(1:16:end),'fs',30.72e6);
  fvtool(inputdata_34(1:16:end),'fs',30.72e6);

%% ********************************** IMPULSE INPUT *********************************************
% 
% DUC_LINEUP_param.inputdata_A1xC1 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A1xC2 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A1xC3 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A1xC4 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A1xC5 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A1xC6 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A1xC7 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A1xC8 = zeros(1,1920)';

% DUC_LINEUP_param.inputdata_A2xC1 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A2xC2 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A2xC3 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A2xC4 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A2xC5 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A2xC6 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A2xC7 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A2xC8 = zeros(1,1920)';
% 
% 
% DUC_LINEUP_param.inputdata_A3xC1 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A3xC2 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A3xC3 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A3xC4 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A3xC5 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A3xC6 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A3xC7 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A3xC8 = zeros(1,1920)';
% 
% DUC_LINEUP_param.inputdata_A4xC1 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A4xC2 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A4xC3 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A4xC4 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A4xC5 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A4xC6 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A4xC7 = zeros(1,1920)';
% DUC_LINEUP_param.inputdata_A4xC8 = zeros(1,1920)';


% DUC_LINEUP_param.inputdata_A1xC1(length(DUC_LINEUP_param.inputdata_A1xC1)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A1xC2(length(DUC_LINEUP_param.inputdata_A1xC2)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A1xC3(length(DUC_LINEUP_param.inputdata_A1xC3)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A1xC4(length(DUC_LINEUP_param.inputdata_A1xC4)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A1xC5(length(DUC_LINEUP_param.inputdata_A1xC5)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A1xC6(length(DUC_LINEUP_param.inputdata_A1xC6)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A1xC7(length(DUC_LINEUP_param.inputdata_A1xC7)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A1xC8(length(DUC_LINEUP_param.inputdata_A1xC8)/2,1) = complex(0.9,0.9);
% 
% DUC_LINEUP_param.inputdata_A2xC1(length(DUC_LINEUP_param.inputdata_A2xC1)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A2xC2(length(DUC_LINEUP_param.inputdata_A2xC2)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A2xC3(length(DUC_LINEUP_param.inputdata_A2xC3)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A2xC4(length(DUC_LINEUP_param.inputdata_A2xC4)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A2xC5(length(DUC_LINEUP_param.inputdata_A2xC5)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A2xC6(length(DUC_LINEUP_param.inputdata_A2xC6)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A2xC7(length(DUC_LINEUP_param.inputdata_A2xC7)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A2xC8(length(DUC_LINEUP_param.inputdata_A2xC8)/2,1) = complex(0.9,0.9);
% 
% DUC_LINEUP_param.inputdata_A3xC1(length(DUC_LINEUP_param.inputdata_A3xC1)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A3xC2(length(DUC_LINEUP_param.inputdata_A3xC2)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A3xC3(length(DUC_LINEUP_param.inputdata_A3xC3)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A3xC4(length(DUC_LINEUP_param.inputdata_A3xC4)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A3xC5(length(DUC_LINEUP_param.inputdata_A3xC5)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A3xC6(length(DUC_LINEUP_param.inputdata_A3xC6)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A3xC7(length(DUC_LINEUP_param.inputdata_A3xC7)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A3xC8(length(DUC_LINEUP_param.inputdata_A3xC8)/2,1) = complex(0.9,0.9);
% 
% DUC_LINEUP_param.inputdata_A4xC1(length(DUC_LINEUP_param.inputdata_A4xC1)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A4xC2(length(DUC_LINEUP_param.inputdata_A4xC2)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A4xC3(length(DUC_LINEUP_param.inputdata_A4xC3)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A4xC4(length(DUC_LINEUP_param.inputdata_A4xC4)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A4xC5(length(DUC_LINEUP_param.inputdata_A4xC5)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A4xC6(length(DUC_LINEUP_param.inputdata_A4xC6)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A4xC7(length(DUC_LINEUP_param.inputdata_A4xC7)/2,1) = complex(0.9,0.9);
% DUC_LINEUP_param.inputdata_A4xC8(length(DUC_LINEUP_param.inputdata_A4xC8)/2,1) = complex(0.9,0.9);
% 
%  
% inputdata_length = 16 * length(DUC_LINEUP_param.inputdata_A1xC1);
%   
% DUC_LINEUP_param.inputdata_A12 = zeros(1,inputdata_length)';
% DUC_LINEUP_param.inputdata_A34 = zeros(1,inputdata_length)';
% 
% DUC_LINEUP_param.inputdata_A12(1:16:end) = DUC_LINEUP_param.inputdata_A1xC1;
% DUC_LINEUP_param.inputdata_A12(2:16:end) = DUC_LINEUP_param.inputdata_A1xC2;
% DUC_LINEUP_param.inputdata_A12(3:16:end) = DUC_LINEUP_param.inputdata_A1xC3;
% DUC_LINEUP_param.inputdata_A12(4:16:end) = DUC_LINEUP_param.inputdata_A1xC4;
% DUC_LINEUP_param.inputdata_A12(5:16:end) = DUC_LINEUP_param.inputdata_A1xC5;
% DUC_LINEUP_param.inputdata_A12(6:16:end) = DUC_LINEUP_param.inputdata_A1xC6;
% DUC_LINEUP_param.inputdata_A12(7:16:end) = DUC_LINEUP_param.inputdata_A1xC7;
% DUC_LINEUP_param.inputdata_A12(8:16:end) = DUC_LINEUP_param.inputdata_A1xC8;

% DUC_LINEUP_param.inputdata_A12(9:16:end)  = DUC_LINEUP_param.inputdata_A2xC1;
% DUC_LINEUP_param.inputdata_A12(10:16:end) = DUC_LINEUP_param.inputdata_A2xC2;
% DUC_LINEUP_param.inputdata_A12(11:16:end) = DUC_LINEUP_param.inputdata_A2xC3;
% DUC_LINEUP_param.inputdata_A12(12:16:end) = DUC_LINEUP_param.inputdata_A2xC4;
% DUC_LINEUP_param.inputdata_A12(13:16:end) = DUC_LINEUP_param.inputdata_A2xC5;
% DUC_LINEUP_param.inputdata_A12(14:16:end) = DUC_LINEUP_param.inputdata_A2xC6;
% DUC_LINEUP_param.inputdata_A12(15:16:end) = DUC_LINEUP_param.inputdata_A2xC7;
% DUC_LINEUP_param.inputdata_A12(16:16:end) = DUC_LINEUP_param.inputdata_A2xC8;
%  
% DUC_LINEUP_param.inputdata_A34(1:16:end) = DUC_LINEUP_param.inputdata_A3xC1;
% DUC_LINEUP_param.inputdata_A34(2:16:end) = DUC_LINEUP_param.inputdata_A3xC2;
% DUC_LINEUP_param.inputdata_A34(3:16:end) = DUC_LINEUP_param.inputdata_A3xC3;
% DUC_LINEUP_param.inputdata_A34(4:16:end) = DUC_LINEUP_param.inputdata_A3xC4;
% DUC_LINEUP_param.inputdata_A34(5:16:end) = DUC_LINEUP_param.inputdata_A3xC5;
% DUC_LINEUP_param.inputdata_A34(6:16:end) = DUC_LINEUP_param.inputdata_A3xC6;
% DUC_LINEUP_param.inputdata_A34(7:16:end) = DUC_LINEUP_param.inputdata_A3xC7;
% DUC_LINEUP_param.inputdata_A34(8:16:end) = DUC_LINEUP_param.inputdata_A3xC8;
% 
% DUC_LINEUP_param.inputdata_A34(9:16:end)  = DUC_LINEUP_param.inputdata_A4xC1;
% DUC_LINEUP_param.inputdata_A34(10:16:end) = DUC_LINEUP_param.inputdata_A4xC2;
% DUC_LINEUP_param.inputdata_A34(11:16:end) = DUC_LINEUP_param.inputdata_A4xC3;
% DUC_LINEUP_param.inputdata_A34(12:16:end) = DUC_LINEUP_param.inputdata_A4xC4;
% DUC_LINEUP_param.inputdata_A34(13:16:end) = DUC_LINEUP_param.inputdata_A4xC5;
% DUC_LINEUP_param.inputdata_A34(14:16:end) = DUC_LINEUP_param.inputdata_A4xC6;
% DUC_LINEUP_param.inputdata_A34(15:16:end) = DUC_LINEUP_param.inputdata_A4xC7;
% DUC_LINEUP_param.inputdata_A34(16:16:end) = DUC_LINEUP_param.inputdata_A4xC8;
% 
%  inputdata_34 = DUC_LINEUP_param.inputdata_A34;
%  inputdata_12 = DUC_LINEUP_param.inputdata_A12;
%  
%   fvtool(inputdata_12(1:16:end),'fs',30.72e6);
%   fvtool(inputdata_34(1:16:end),'fs',30.72e6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sample Rate Configuration 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DUC_LINEUP_param.SampleRate_A1xC1=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A1xC2=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A1xC3=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A1xC4=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A1xC5=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A1xC6=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A1xC7=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A1xC8=DUC_LINEUP_param.SampleRate_20MHz;

DUC_LINEUP_param.SampleRate_A2xC1=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A2xC2=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A2xC3=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A2xC4=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A2xC5=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A2xC6=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A2xC7=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A2xC8=DUC_LINEUP_param.SampleRate_20MHz;

DUC_LINEUP_param.SampleRate_A3xC1=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A3xC2=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A3xC3=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A3xC4=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A3xC5=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A3xC6=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A3xC7=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A3xC8=DUC_LINEUP_param.SampleRate_20MHz;

DUC_LINEUP_param.SampleRate_A4xC1=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A4xC2=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A4xC3=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A4xC4=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A4xC5=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A4xC6=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A4xC7=DUC_LINEUP_param.SampleRate_20MHz;
DUC_LINEUP_param.SampleRate_A4xC8=DUC_LINEUP_param.SampleRate_20MHz;


%% Derived Parameters 
DUC_LINEUP_param.Period_A1xC1          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC1);           % Clock cycles between consecutive data samples for a particular channel
DUC_LINEUP_param.Period_A1xC2          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC2);           
DUC_LINEUP_param.Period_A1xC3          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC3);           
DUC_LINEUP_param.Period_A1xC4          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC4);           
DUC_LINEUP_param.Period_A1xC5          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC5);           
DUC_LINEUP_param.Period_A1xC6          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC6);           
DUC_LINEUP_param.Period_A1xC7          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC7);           
DUC_LINEUP_param.Period_A1xC8          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A1xC8);           

DUC_LINEUP_param.Period_A2xC1          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC1);           
DUC_LINEUP_param.Period_A2xC2          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC2);           
DUC_LINEUP_param.Period_A2xC3          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC3);           
DUC_LINEUP_param.Period_A2xC4          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC4);           
DUC_LINEUP_param.Period_A2xC5          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC5); 
DUC_LINEUP_param.Period_A2xC6          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC6); 
DUC_LINEUP_param.Period_A2xC7          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC7); 
DUC_LINEUP_param.Period_A2xC8          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A2xC8); 

DUC_LINEUP_param.Period_A3xC1          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC1);           
DUC_LINEUP_param.Period_A3xC2          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC2);           
DUC_LINEUP_param.Period_A3xC3          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC3);           
DUC_LINEUP_param.Period_A3xC4          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC4);           
DUC_LINEUP_param.Period_A3xC5          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC5); 
DUC_LINEUP_param.Period_A3xC6          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC6); 
DUC_LINEUP_param.Period_A3xC7          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC7); 
DUC_LINEUP_param.Period_A3xC8          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A3xC8); 

DUC_LINEUP_param.Period_A4xC1          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC1);           
DUC_LINEUP_param.Period_A4xC2          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC2);           
DUC_LINEUP_param.Period_A4xC3          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC3);           
DUC_LINEUP_param.Period_A4xC4          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC4);           
DUC_LINEUP_param.Period_A4xC5          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC5); 
DUC_LINEUP_param.Period_A4xC6          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC6); 
DUC_LINEUP_param.Period_A4xC7          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC7); 
DUC_LINEUP_param.Period_A4xC8          = ceil(DUC_LINEUP_param.ClockRate / DUC_LINEUP_param.SampleRate_A4xC8); 


