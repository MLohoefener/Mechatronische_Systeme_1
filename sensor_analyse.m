% Script for analysing of sensor data via MQTT/JSON: sensor_analyse.m
% Tested with GNU Octave and MATLAB
% For Octave only:
% >> pkg install https://github.com/apjanke/octave-jsonstuff/releases/download/v0.3.3/jsonstuff-0.3.3.tar.gz
% >> pkg load jsonstuff
% Sometimes of interest: https://github.com/fangq/jsonlab
% 27.02.2020, Manfred Lohöfener, HoMe

%% Subscribe
clear
%broker = 'test.mosquitto.org';
broker = 'broker.hivemq.com';
%broker = 'iot.hs-merseburg.de';
topic = 'HoMe18';
[stat, sensor_json] = mqtt_sub (broker, topic);
  disp (' ')
  disp ('JSON String sensor_json')
  disp (sensor_json)

%% Test 
sensor_json_sensor = jsondecode (sensor_json);  % Plain MATLAB or Octave with package JSONstuff
%sensor_json_sensor = loadjson (sensor_json);   % From JSONlab toolbox
%sensor_json_sensor = loadubjson (sensor_json); % From JSONlab toolbox
  disp (' ')
  disp ('Test sensor_json_sensor')
  disp (sensor_json_sensor)
