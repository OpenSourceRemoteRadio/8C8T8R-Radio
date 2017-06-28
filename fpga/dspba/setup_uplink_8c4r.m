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

%% DDC_Lineup_param - DSPBA Design Parameters Start
clear DDC_Lineup_param; 

addpath library/cfr
addpath library/complex_real
addpath library/cordic
addpath library/dc_blocker
addpath library/dpd
addpath library/hddc
addpath library/hduc
addpath library/iq_splitter
addpath library/iq_mixer
addpath library/lddc
addpath library/lduc
addpath library/mixer
addpath library/pipe_reg
addpath library/real_complex
addpath library/summer
addpath library/ddc_mixer

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Specify whether to generate Co-efficients or use(load) already existing co-efficient
% To Load co-efficient from file which is generated from filter Design
% Analysis tool,  the file format should be .txt file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coeff='load'; config='8c8t8r_coeff_cfg_08'; 
%%coeff='generate';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify NCO Tunning  Values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DDC_Lineup_param.Complex_NCO_A1.Freq = [-30 -10 10 30 -30 -10 10 30]; %% [ A1C1 A1C2 A1C3 A1C4 ] in MHz
%DDC_Lineup_param.Complex_NCO_A2.Freq = [-30 -10 10 30 -30 -10 10 30]; %% [ A2C1 A2C2 A2C3 A2C4 ] in MHz
%DDC_Lineup_param.Complex_NCO_A3.Freq = [-30 -10 10 30 -30 -10 10 30]; %% [ A3C1 A3C2 A3C3 A3C4 ] in MHz
%DDC_Lineup_param.Complex_NCO_A4.Freq = [-30 -10 10 30 -30 -10 10 30]; %% [ A4C1 A4C2 A4C3 A4C4 ] in MHz
% 
% DDC_Lineup_param.Complex_NCO_A1.Freq = [30 10 -10 -30 30 10 -10 -30]; %% [ A1C1 A1C2 A1C3 A1C4 ] in MHz
% DDC_Lineup_param.Complex_NCO_A2.Freq = [30 10 -10 -30 30 10 -10 -30]; %% [ A2C1 A2C2 A2C3 A2C4 ] in MHz
% DDC_Lineup_param.Complex_NCO_A3.Freq = [30 10 -10 -30 30 10 -10 -30]; %% [ A3C1 A3C2 A3C3 A3C4 ] in MHz
% DDC_Lineup_param.Complex_NCO_A4.Freq = [30 10 -10 -30 30 10 -10 -30]; %% [ A4C1 A4C2 A4C3 A4C4 ] in MHz
 
 
%  % 
%  DDC_Lineup_param.Complex_NCO_A1.Freq = [-9 -7 -5 -3 -1 2 4 6]; %% [ A1C1 A1C2 A1C3 A1C4 ] in MHz
%  DDC_Lineup_param.Complex_NCO_A2.Freq = [-8 -6 -4 -2  0 1 3 5]; %% [ A2C1 A2C2 A2C3 A2C4 ] in MHz
%  DDC_Lineup_param.Complex_NCO_A3.Freq = [-10 -8 -6 -4 -2 3 5 7]; %% [ A3C1 A3C2 A3C3 A3C4 ] in MHz
%  DDC_Lineup_param.Complex_NCO_A4.Freq = [-9  -8 -7 -5 -3 2 3 8]; %% [ A4C1 A4C2 A4C3 A4C4 ] in MHz

% 
 DDC_Lineup_param.Complex_NCO_A1.Freq = [0 0 0 0 0 0 0 0]; %% [ A1C1 A1C2 A1C3 A1C4 ] in MHz
 DDC_Lineup_param.Complex_NCO_A2.Freq = [0 0 0 0 0 0 0 0]; %% [ A2C1 A2C2 A2C3 A2C4 ] in MHz
 DDC_Lineup_param.Complex_NCO_A3.Freq = [0 0 0 0 0 0 0 0]; %% [ A3C1 A3C2 A3C3 A3C4 ] in MHz
 DDC_Lineup_param.Complex_NCO_A4.Freq = [0 0 0 0 0 0 0 0]; %% [ A4C1 A4C2 A4C3 A4C4 ] in MHz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input Signal Frequncy Declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DDC_Lineup_param.A1xC1_Freq = -35;     %% in MHz 
DDC_Lineup_param.A1xC2_Freq = -8;    %% in MHz 
DDC_Lineup_param.A1xC3_Freq =  9;     %% in MHz 
DDC_Lineup_param.A1xC4_Freq =  32;      %% in MHz 
DDC_Lineup_param.A1xC5_Freq = -33;     %% in MHz 
DDC_Lineup_param.A1xC6_Freq = -6;    %% in MHz 
DDC_Lineup_param.A1xC7_Freq =  11;     %% in MHz 
DDC_Lineup_param.A1xC8_Freq =  35;      %% in MHz 

% DDC_Lineup_param.A2xC1_Freq = -36;      %% in MHz 
% DDC_Lineup_param.A2xC2_Freq = -9.5;     %% in MHz 
% DDC_Lineup_param.A2xC3_Freq = 10.1;     %% in MHz 
% DDC_Lineup_param.A2xC4_Freq = 33;       %% in MHz 
% 
% DDC_Lineup_param.A3xC1_Freq = -37;      %% in MHz 
% DDC_Lineup_param.A3xC2_Freq = -10.5;    %% in MHz 
% DDC_Lineup_param.A3xC3_Freq = 11.1;     %% in MHz 
% DDC_Lineup_param.A3xC4_Freq = 34;       %% in MHz 
% 
% DDC_Lineup_param.A4xC1_Freq = -38;      %% in MHz 
% DDC_Lineup_param.A4xC2_Freq = -11.5;    %% in MHz 
% DDC_Lineup_param.A4xC3_Freq = 12.1;     %% in MHz 
% DDC_Lineup_param.A4xC4_Freq = 35;       %% in MHz 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% System Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DDC_Lineup_param.ChanCount   = 1;                 % How many data channels
DDC_Lineup_param.ClockRate   = 491.52;            % The system clock rate in MHz
DDC_Lineup_param.SampleRate  = 491.52;            % The data rate per channel in MSps (mega-samples per second)
DDC_Lineup_param.total_AxC   = 8 ;
DDC_Lineup_param.Base_Addr   = 0 ;
format long;
OccupiedBW = 0.9; % Proportion of LTE carrier filled with subcarriers
           % The data rate per channel in MSps (mega-samples per second)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pipe Line Constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DSPBA_Features.schedulerAttempts = 1000;
DDC_Lineup_param.ClockMargin = 100;  

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data Type Specification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DDC_Lineup_param.input_word_length      = 16;         % Input data: bit width
DDC_Lineup_param.input_fraction_length  = 15;         % Input data: fraction width

DDC_Lineup_param.output_word_length     = 16;         % Output data: bit width
DDC_Lineup_param.output_fraction_length = 15;         % Output data: fraction width


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ModelIP FILTER CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DC_Blocker_multiplication_factor = 1;
DC_Blocker_Number_of_bits_to_shift_left = -8;


DDC_Lineup_param.HB_filter7.SampleRate            = DDC_Lineup_param.SampleRate; % Input rate at filter1
DDC_Lineup_param.HB_filter7.Decimation            = 2;                           % Decimation rate  
DDC_Lineup_param.HB_filter7.ChanCount             = DDC_Lineup_param.ChanCount;
DDC_Lineup_param.HB_filter7.coeff_word_length     = 16;                          % filter1 coefficient: bit width
DDC_Lineup_param.HB_filter7.coeff_fraction_length = 15;                          % filter1 coefficient: fraction width 
DDC_Lineup_param.HB_filter7.FilterLength          = 15; 
DDC_Lineup_param.HB_filter7.base_addr1             = DDC_Lineup_param.Base_Addr;                        
DDC_Lineup_param.HB_filter7.base_addr2             = DDC_Lineup_param.HB_filter7.base_addr1+128;     
DDC_Lineup_param.HB_filter7.base_addr3             = DDC_Lineup_param.HB_filter7.base_addr2+128;  
DDC_Lineup_param.HB_filter7.base_addr4             = DDC_Lineup_param.HB_filter7.base_addr3+128;  
                       

DDC_Lineup_param.HB_filter6.SampleRate            = DDC_Lineup_param.SampleRate/2; % Input rate at filter1
DDC_Lineup_param.HB_filter6.Decimation            = 2;                           % Decimation rate  
DDC_Lineup_param.HB_filter6.ChanCount             = DDC_Lineup_param.ChanCount;
DDC_Lineup_param.HB_filter6.coeff_word_length     = 16;                          % filter1 coefficient: bit width
DDC_Lineup_param.HB_filter6.coeff_fraction_length = 15;                          % filter1 coefficient: fraction width 
DDC_Lineup_param.HB_filter6.FilterLength          = 17; 
DDC_Lineup_param.HB_filter6.base_addr1            = DDC_Lineup_param.HB_filter7.base_addr4 + 128;                        
DDC_Lineup_param.HB_filter6.base_addr2            = DDC_Lineup_param.HB_filter6.base_addr1 + 128;  
DDC_Lineup_param.HB_filter6.base_addr3            = DDC_Lineup_param.HB_filter6.base_addr2 + 128;  
DDC_Lineup_param.HB_filter6.base_addr4            = DDC_Lineup_param.HB_filter6.base_addr3 + 128;  


DDC_Lineup_param.Complex_NCO.SampleRate            = DDC_Lineup_param.SampleRate/4;                       
DDC_Lineup_param.Complex_NCO.Data_type             = DDC_Lineup_param.output_word_length;
DDC_Lineup_param.Complex_NCO.scaling_value         = DDC_Lineup_param.output_fraction_length;
DDC_Lineup_param.Complex_NCO.Acumulater_bit_wid    = 24;    

DDC_Lineup_param.Complex_NCO_A1.Freq_word             = ((DDC_Lineup_param.Complex_NCO_A1.Freq*2^DDC_Lineup_param.Complex_NCO.Acumulater_bit_wid) / (DDC_Lineup_param.Complex_NCO.SampleRate)) ;                          
DDC_Lineup_param.Complex_NCO_A2.Freq_word             = ((DDC_Lineup_param.Complex_NCO_A2.Freq*2^DDC_Lineup_param.Complex_NCO.Acumulater_bit_wid) / (DDC_Lineup_param.Complex_NCO.SampleRate)) ;                          
DDC_Lineup_param.Complex_NCO_A3.Freq_word             = ((DDC_Lineup_param.Complex_NCO_A3.Freq*2^DDC_Lineup_param.Complex_NCO.Acumulater_bit_wid) / (DDC_Lineup_param.Complex_NCO.SampleRate)) ;                          
DDC_Lineup_param.Complex_NCO_A4.Freq_word             = ((DDC_Lineup_param.Complex_NCO_A4.Freq*2^DDC_Lineup_param.Complex_NCO.Acumulater_bit_wid) / (DDC_Lineup_param.Complex_NCO.SampleRate)) ;                          

DDC_Lineup_param.Complex_NCO_A1.base_addr             = DDC_Lineup_param.HB_filter6.base_addr4 + 128;
DDC_Lineup_param.Complex_NCO_A2.base_addr             = DDC_Lineup_param.Complex_NCO_A1.base_addr + 128;
DDC_Lineup_param.Complex_NCO_A3.base_addr             = DDC_Lineup_param.Complex_NCO_A2.base_addr + 128;
DDC_Lineup_param.Complex_NCO_A4.base_addr             = DDC_Lineup_param.Complex_NCO_A3.base_addr + 128;


%% complex mixer
DDC_Lineup_param.CM.SampleRate            = DDC_Lineup_param.SampleRate/4;                              % output rate at CM  - 122.88 -- 4*30.72
DDC_Lineup_param.CM.No_Of_complex_chan    = DDC_Lineup_param.total_AxC;
DDC_Lineup_param.CM.No_Of_complex_Freq    = DDC_Lineup_param.total_AxC;

DDC_CM_multiplication_factor        = [1 1 1 1];
DDC_CM_Number_of_bits_to_shift_left = [0 1 2 3];

DDC_CM_NCO_sync  = [0 0];
DDC_CM_NCO_phase = [0 0];

DDC1_NCO_Sync_bit = DDC_Lineup_param.Complex_NCO_A4.base_addr +8;
DDC1_Mixer_Shifter_Bits = DDC1_NCO_Sync_bit+1;
DDC1_Mixer_Shifter_init_value = 0;     

DDC2_NCO_Sync_bit = DDC1_Mixer_Shifter_Bits+1;
DDC2_Mixer_Shifter_Bits = DDC2_NCO_Sync_bit+1;
DDC2_Mixer_Shifter_init_value = 0;

DDC3_NCO_Sync_bit = DDC2_Mixer_Shifter_Bits+1;
DDC3_Mixer_Shifter_Bits = DDC3_NCO_Sync_bit+1;
DDC3_Mixer_Shifter_init_value = 0;

DDC4_NCO_Sync_bit = DDC3_Mixer_Shifter_Bits+1;
DDC4_Mixer_Shifter_Bits = DDC4_NCO_Sync_bit+1;
DDC4_Mixer_Shifter_init_value = 0;


%% Filter 2 - HB5
DDC_Lineup_param.HB_filter5.SampleRate            = DDC_Lineup_param.SampleRate/4;         % Input rate at filter2
DDC_Lineup_param.HB_filter5.FilterLength          = 27;                           % Number of Taps is not doesnt depend on parameter- Filter Lengh. It inherits from Coefficient file.
DDC_Lineup_param.HB_filter5.Decimation            = 2;                           % Decmation rate  
DDC_Lineup_param.HB_filter5.ChanCount             = DDC_Lineup_param.total_AxC;
DDC_Lineup_param.HB_filter5.coeff_word_length     = 16;                          % filter2 coefficient: bit width
DDC_Lineup_param.HB_filter5.coeff_fraction_length = 15;                          % filter2 coefficient: fraction width 
DDC_Lineup_param.HB_filter5.base_addr1             = DDC4_Mixer_Shifter_Bits + 1;                         
DDC_Lineup_param.HB_filter5.base_addr2             = DDC_Lineup_param.HB_filter5.base_addr1 + 128;                         
DDC_Lineup_param.HB_filter5.base_addr3             = DDC_Lineup_param.HB_filter5.base_addr2 + 128; 
DDC_Lineup_param.HB_filter5.base_addr4             = DDC_Lineup_param.HB_filter5.base_addr3 + 128; 
                       

%% Filter 3 - HB4
DDC_Lineup_param.HB_filter4.SampleRate            = DDC_Lineup_param.SampleRate/8;         % Input rate at filter3
DDC_Lineup_param.HB_filter4.Decimation            = 2;                           % Interpolation rate  
DDC_Lineup_param.HB_filter4.ChanCount             = DDC_Lineup_param.total_AxC;
DDC_Lineup_param.HB_filter4.coeff_word_length     = 16;                          % filter3 coefficient: bit width
DDC_Lineup_param.HB_filter4.coeff_fraction_length = 15;                          % filter3 coefficient: fraction width 
DDC_Lineup_param.HB_filter4.FilterLength          = 47;                           % Number of Taps is not doesnt depend on parameter- Filter Lengh. It inherits from Coefficient file.
DDC_Lineup_param.HB_filter4.base_addr1            = DDC_Lineup_param.HB_filter5.base_addr4 + 128;   
DDC_Lineup_param.HB_filter4.base_addr2            = DDC_Lineup_param.HB_filter4.base_addr1 + 128; 
DDC_Lineup_param.HB_filter4.base_addr3            = DDC_Lineup_param.HB_filter4.base_addr2 + 128; 
DDC_Lineup_param.HB_filter4.base_addr4            = DDC_Lineup_param.HB_filter4.base_addr3 + 128; 


%% Filter 6 - Channel Filter
DDC_Lineup_param.CH_filter.SampleRate         = DDC_Lineup_param.SampleRate/16;     
DDC_Lineup_param.CH_filter.FilterLength          = 87; 
DDC_Lineup_param.CH_filter.ChanCount             = DDC_Lineup_param.total_AxC;
DDC_Lineup_param.CH_filter.coeff_word_length     = 16;                          % filter6 coefficient: bit width
DDC_Lineup_param.CH_filter.coeff_fraction_length = 15;                          % filter6 coefficient: fraction width 
DDC_Lineup_param.CH_filter.base_addr1            = DDC_Lineup_param.HB_filter4.base_addr4 + 128;                         
DDC_Lineup_param.CH_filter.base_addr2            = DDC_Lineup_param.CH_filter.base_addr1 + 128;                         
DDC_Lineup_param.CH_filter.base_addr3            = DDC_Lineup_param.CH_filter.base_addr2 + 128;                         
DDC_Lineup_param.CH_filter.base_addr4            = DDC_Lineup_param.CH_filter.base_addr3 + 128;                         


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  GENERATE/LOAD CO-EFF FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(strcmp(coeff,'generate')==1) 
    
    %% HBdec06 Filter
    DDC_Lineup_param.HB_filter6.FilterLength          = 16;                          % Number of Taps
    DDC_Lineup_param.HB_filter6.Ast                   = 140;                         % stopband attenuation        
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DDC_Lineup_param.HB_filter6.FilterLength,DDC_Lineup_param.HB_filter6.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);              % Equiripple 
    hb6_coeff=fdes.Numerator;
    DDC_Lineup_param.HB_filter6.coeffs(1,:) = fi(hb6_coeff',1,DDC_Lineup_param.HB_filter6.coeff_word_length,DDC_Lineup_param.HB_filter6.coeff_fraction_length); 
    save('CFG_G/hbdec06_Coeffs.txt','hb6_coeff','-ASCII','-DOUBLE'); 
    
    %% HBdec05 Filter
    DDC_Lineup_param.HB_filter5.FilterLength          = 26;                          % Number of Taps    
    DDC_Lineup_param.HB_filter5.Ast                   = 140;                         % stopband attenuation    
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DDC_Lineup_param.HB_filter5.FilterLength,DDC_Lineup_param.HB_filter5.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);              % Equiripple 
    hb5_coeff=fdes.Numerator;
    DDC_Lineup_param.HB_filter5.coeffs(1,:) = fi(hb5_coeff',1,DDC_Lineup_param.HB_filter5.coeff_word_length,DDC_Lineup_param.HB_filter5.coeff_fraction_length); 
    save('CFG_G/hbdec05_coeffs.txt','hb5_coeff','-ASCII','-DOUBLE');
    
    %% HBdec04 Filter
    DDC_Lineup_param.HB_filter4.FilterLength          = 32;                          % Number of Taps
    DDC_Lineup_param.HB_filter4.Ast                   = 90;                         % stopband attenuation  
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DDC_Lineup_param.HB_filter4.FilterLength,DDC_Lineup_param.HB_filter4.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);              % Equiripple 
    hb4_coeff=fdes.Numerator;
    DDC_Lineup_param.HB_filter4.coeffs(1,:) = fi(hb4_coeff',1,DDC_Lineup_param.HB_filter4.coeff_word_length,DDC_Lineup_param.HB_filter4.coeff_fraction_length); 
    save('CFG_G/hbdec04_coeffs.txt','hb4_coeff','-ASCII','-DOUBLE');
    
    %% HBdec03 Filter
    DDC_Lineup_param.HB_filter3.FilterLength           = 32;                          % Number of Taps
    DDC_Lineup_param.HB_filter3.Ast                    = 90;                         % stopband attenuation    
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DDC_Lineup_param.HB_filter3.FilterLength,DDC_Lineup_param.HB_filter3.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);               % Equiripple 
    hb3_coeff=fdes.Numerator;
    DDC_Lineup_param.HB_filter3.coeffs(1,:) = fi(hb3_coeff',1,DDC_Lineup_param.HB_filter3.coeff_word_length,DDC_Lineup_param.HB_filter3.coeff_fraction_length); 
    save('CFG_G/hbdec03_coeffs.txt','hb3_coeff','-ASCII','-DOUBLE');

    %% HB_filter2 Filter
    DDC_Lineup_param.HB_filter2.FilterLength           = 16;                          % Number of Taps
    DDC_Lineup_param.HB_filter2.Ast                    = 100;                          % stopband attenuation    
    fdes = fdesign.halfband('Type','Lowpass','N,Ast',DDC_Lineup_param.HB_filter2.FilterLength,DDC_Lineup_param.HB_filter2.Ast);
    fdes = design(fdes,'equiripple','SystemObject',true);               % Equiripple 
    hb2_coeff=fdes.Numerator;
    DDC_Lineup_param.HB_filter2.coeffs(1,:) = fi(hb2_coeff',1,DDC_Lineup_param.HB_filter2.coeff_word_length,DDC_Lineup_param.HB_filter2.coeff_fraction_length); 
    save('CFG_G/hbdec02_coeffs.txt','hb2_coeff','-ASCII','-DOUBLE');
        
    %% Channel Filter
    DDC_Lineup_param.CH_filter.FilterLength          = 86;                          % Number of Taps
    DDC_Lineup_param.CH_filter.Fpass                 = 5*OccupiedBW/7.68;% passband 
    DDC_Lineup_param.CH_filter.Fstop                 = 5/7.68;           % stopband 
    DDC_Lineup_param.CH_filter.Aripple               = 0.04;                        % passband ripple   
    fdes = fdesign.lowpass('N,Fp,Fst,Ap',DDC_Lineup_param.CH_filter.FilterLength,DDC_Lineup_param.CH_filter.Fpass,DDC_Lineup_param.CH_filter.Fstop,DDC_Lineup_param.CH_filter.Aripple);
    fdes = design(fdes,'equiripple','SystemObject',true);               % Equiripple 
    CH_filter_coeff=fdes.Numerator;
    DDC_Lineup_param.CH_filter.coeffs(1,:) = fi(CH_filter_coeff',1,DDC_Lineup_param.CH_filter.coeff_word_length,DDC_Lineup_param.CH_filter.coeff_fraction_length); 
    save('CFG_G/ChanFilt_coeffs.txt','chanfilt_coeff' ,'-ASCII','-DOUBLE');


elseif(strcmp(coeff,'load')==1) 
    chanfilt_coeff = [ config '/chanfilt_coeffs.txt'];
    hb4_coeff      = [ config '/hbdec04_coeffs.txt'];
    hb5_coeff      = [ config '/hbdec05_coeffs.txt'];
    hb6_coeff      = [ config '/hbdec06_coeffs.txt'];
    hb7_coeff      = [ config '/hbdec07_coeffs.txt'];    
    
    DDC_Lineup_param.chan_filter.coeffs(1,:)  =fi(load(chanfilt_coeff),1,DDC_Lineup_param.CH_filter.coeff_word_length,DDC_Lineup_param.CH_filter.coeff_fraction_length);
    DDC_Lineup_param.HB_filt4.coeffs(1,:)     =fi(load(hb4_coeff),1,DDC_Lineup_param.HB_filter4.coeff_word_length,DDC_Lineup_param.HB_filter4.coeff_fraction_length);
    DDC_Lineup_param.HB_filt5.coeffs(1,:)     =fi(load(hb5_coeff),1,DDC_Lineup_param.HB_filter5.coeff_word_length,DDC_Lineup_param.HB_filter5.coeff_fraction_length);
    DDC_Lineup_param.HB_filt6.coeffs(1,:)     =fi(load(hb6_coeff),1,DDC_Lineup_param.HB_filter6.coeff_word_length,DDC_Lineup_param.HB_filter6.coeff_fraction_length);
    DDC_Lineup_param.HB_filt7.coeffs(1,:)     =fi(load(hb7_coeff),1,DDC_Lineup_param.HB_filter7.coeff_word_length,DDC_Lineup_param.HB_filter7.coeff_fraction_length);

end    
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulation Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

DDC_Lineup_param.SampleTime  = 1;                    % One unit in Simulink simulation is one clock cycle 
DDC_Lineup_param.endTime     = 5000*2;                 % How many simulation clock cycles
DDC_Lineup_param.ContiguousValidFrames   = 1;        % Create a sequence of valid and invali frames of stimulus data in the Channelizer block
DDC_Lineup_param.ContiguousInvalidFrames = 0; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEST_BENCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Complex INPUT for ANT 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% DDC_Lineup_param.inputdata_A1xC1 = zeros(2,DDC_Lineup_param.endTime+1); 
% DDC_Lineup_param.inputdata_A1xC2 = zeros(2,DDC_Lineup_param.endTime+1);
% DDC_Lineup_param.inputdata_A1xC3 = zeros(2,DDC_Lineup_param.endTime+1);
% DDC_Lineup_param.inputdata_A1xC4 = zeros(2,DDC_Lineup_param.endTime+1);
% DDC_Lineup_param.inputdata_A1xC5 = zeros(2,DDC_Lineup_param.endTime+1); 
% DDC_Lineup_param.inputdata_A1xC6 = zeros(2,DDC_Lineup_param.endTime+1);
% DDC_Lineup_param.inputdata_A1xC7 = zeros(2,DDC_Lineup_param.endTime+1);
% DDC_Lineup_param.inputdata_A1xC8 = zeros(2,DDC_Lineup_param.endTime+1);
% 
% DDC_Lineup_param.inputdata_A1xC  = zeros(2,DDC_Lineup_param.endTime+1);
% DDC_Lineup_param.inputdata1      = zeros(1,DDC_Lineup_param.endTime+1);
% 
% DDC_Lineup_param.inputdata_A1xC1(1,:) = 0.9* cos(2*pi*(DDC_Lineup_param.A1xC1_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC1(2,:) = 0.9* sin(2*pi*(DDC_Lineup_param.A1xC1_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
%  
% DDC_Lineup_param.inputdata_A1xC2(1,:) = 0.9* cos(2*pi*(DDC_Lineup_param.A1xC2_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC2(2,:) = 0.9* sin(2*pi*(DDC_Lineup_param.A1xC2_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
%  
% DDC_Lineup_param.inputdata_A1xC3(1,:) = 0.9*cos(2*pi*(DDC_Lineup_param.A1xC3_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC3(2,:) = 0.9*sin(2*pi*(DDC_Lineup_param.A1xC3_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
%  
% DDC_Lineup_param.inputdata_A1xC4(1,:) = 0.9*cos(2*pi*(DDC_Lineup_param.A1xC4_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC4(2,:) = 0.9*sin(2*pi*(DDC_Lineup_param.A1xC4_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% 
% DDC_Lineup_param.inputdata_A1xC5(1,:) = 0.9* cos(2*pi*(DDC_Lineup_param.A1xC5_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC5(2,:) = 0.9* sin(2*pi*(DDC_Lineup_param.A1xC5_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
%  
% DDC_Lineup_param.inputdata_A1xC6(1,:) = 0.9* cos(2*pi*(DDC_Lineup_param.A1xC6_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC6(2,:) = 0.9* sin(2*pi*(DDC_Lineup_param.A1xC6_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
%  
% DDC_Lineup_param.inputdata_A1xC7(1,:) = 0.9*cos(2*pi*(DDC_Lineup_param.A1xC7_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC7(2,:) = 0.9*sin(2*pi*(DDC_Lineup_param.A1xC7_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
%  
% DDC_Lineup_param.inputdata_A1xC8(1,:) = 0.9*cos(2*pi*(DDC_Lineup_param.A1xC8_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% DDC_Lineup_param.inputdata_A1xC8(2,:) = 0.9*sin(2*pi*(DDC_Lineup_param.A1xC8_Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]); 
% 
% DDC_Lineup_param.inputdata_A1xC(1,:) = DDC_Lineup_param.inputdata_A1xC1(1,:) + DDC_Lineup_param.inputdata_A1xC2(1,:) + DDC_Lineup_param.inputdata_A1xC3(1,:) + DDC_Lineup_param.inputdata_A1xC4(1,:) + DDC_Lineup_param.inputdata_A1xC5(1,:) + DDC_Lineup_param.inputdata_A1xC6(1,:) + DDC_Lineup_param.inputdata_A1xC7(1,:) + DDC_Lineup_param.inputdata_A1xC8(1,:);
%                                        
% DDC_Lineup_param.inputdata_A1xC(2,:) = DDC_Lineup_param.inputdata_A1xC1(2,:) + DDC_Lineup_param.inputdata_A1xC2(2,:) + DDC_Lineup_param.inputdata_A1xC3(2,:) + DDC_Lineup_param.inputdata_A1xC4(2,:) + DDC_Lineup_param.inputdata_A1xC5(2,:) + DDC_Lineup_param.inputdata_A1xC6(2,:) + DDC_Lineup_param.inputdata_A1xC7(2,:) + DDC_Lineup_param.inputdata_A1xC8(2,:); 
%  
% real_data = DDC_Lineup_param.inputdata_A1xC(1,:)/8 ;
% imag_data = DDC_Lineup_param.inputdata_A1xC(2,:)/8 ;
%  
% data_quant=quantizer('fixed','floor','saturate',[16 15]);
% 
% real_data_quant=quantize(data_quant,real_data)*2^15;
% imag_data_quant=quantize(data_quant,imag_data)*2^15;
% 
% fvtool(complex(real_data_quant,imag_data_quant),'fs',491.52e6);
% 
% DDC_Lineup_param.inputdata1=imag_data_quant*2^16+real_data_quant;

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Real INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 DDC_Lineup_param.Freq = 1;
 
 %real_data = 0.9*cos(2*pi*(DDC_Lineup_param.Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]);
 %imag_data = 0.9*sin(2*pi*(DDC_Lineup_param.Freq/DDC_Lineup_param.SampleRate)*[0:1:DDC_Lineup_param.endTime]);
 
% in_data = load('TC06_LTE20_30p72_0.mat');
% in_data = in_data.Hepta_Test_Vector_Data;
% real_data = in_data(1:2:end);
% imag_data = in_data(2:2:end);

 
%  data_quant=quantizer('fixed','floor','saturate',[16 15]);
%  real_data_quant=quantize(data_quant,real_data)*2^15;
%  imag_data_quant=quantize(data_quant,imag_data)*2^15;
%  fvtool(complex(real_data_quant,imag_data_quant),'fs',491.52e6);
% 
%  complex_data=(imag_data_quant*2^16 )*i+real_data_quant; 
%  fvtool(complex_data,'fs',491.52e6);
%  
%  DDC_Lineup_param.inputdata1=complex(real_data,imag_data);
%  fvtool(DDC_Lineup_param.inputdata1,'fs',491.52e6)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Complex INPUT for ANT 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  in_data = load('uplink_8c4r_dpd_data_out.mat');
  inputdata = in_data.dpd_data;
  DDC_Lineup_param.inputdata = inputdata;
%  fvtool(inputdata,'fs',491.52e6)



%% Derived Parameters 
DDC_Lineup_param.Period          = DDC_Lineup_param.ClockRate / DDC_Lineup_param.SampleRate;           % Clock cycles between consecutive data samples for a particular channel

%% DSPBA Design Parameters End
