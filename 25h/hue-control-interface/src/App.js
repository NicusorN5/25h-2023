// App.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCarBattery } from '@fortawesome/free-solid-svg-icons';
import './App.css';


const App = () => {
  const [lights, setLights] = useState([]);
  const [selectedLightId, setSelectedLightId] = useState(16);
  const [isLightOn, setIsLightOn] = useState(false);
  const [isAllLightsConnected, setIsAllLightsConnected] = useState(false);
  const [brightness, setBrightness] = useState(50);
  const [color, setColor] = useState(50);
  const [saturation, setSaturation] = useState(50);
  const [temperature, setTemperature] = useState(50);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await axios.get(
        'http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights'
      );
      setLights(Object.values(response.data));
      const selectedLight = response.data[selectedLightId];
      setIsLightOn(selectedLight?.state?.on || false);
      setBrightness(selectedLight?.state?.bri || 50);
      setColor(
        selectedLight?.state?.hue ? Math.round((selectedLight.state.hue / 65535) * 100) : 50
      );
      setSaturation(selectedLight?.state?.sat || 50);
      setTemperature(
        selectedLight?.state?.ct ? Math.round((selectedLight.state.ct / 500) * 100) : 50
      );
    } catch (error) {
      console.error('Error fetching lights:', error);
    }
  };

  const toggleLight = async () => {
    try {
      if (!isLightOn) {
        await axios.put(
          `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
          { on: true, xy: [0.313, 0.329], ct: 366 }
        );
      } else {
        await axios.put(
          `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
          { on: false }
        );
      }
      fetchData();
    } catch (error) {
      console.error('Error toggling light:', error);
    }
  };

  const changeBrightness = async () => {
    try {
      const calculatedBrightness = Math.round((brightness / 100) * 254);
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { bri: calculatedBrightness }
      );
      fetchData();
      openLight();
    } catch (error) {
      console.error('Error changing brightness:', error);
    }
  };

  const changeColor = async () => {
    try {
      const calculatedColor = Math.round((color / 100) * 65535);
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { hue: calculatedColor }
      );
      fetchData();
      openLight();
    } catch (error) {
      console.error('Error changing color:', error);
    }
  };
   const [showSyncButton, setShowSyncButton] = useState(false);

  const handleShowSyncButton = () => {
    setShowSyncButton(true);
  };

  const randomColor = async () => {
    try {
      const calculatedColor = Math.floor(Math.random() * 65536);
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { hue: calculatedColor, sat: 255 }
      );
      fetchData();
      openLight();
    } catch (error) {
      console.error('Error changing color:', error);
    }
  };

  const connectAllLights = async () => {
    const lightsToConnect = [13, 12, 16, 14, 15, 17];

    try {
      await Promise.all(
        lightsToConnect.map(async (lightId) => {
          await axios.put(
            `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
            { on: true }
          );
        })
      );
      fetchData();
      setIsAllLightsConnected(true);
    } catch (error) {
      console.error('Error connecting lights:', error);
    }
  };

  const disconnectAllLights = async () => {
    const lightsToDisconnect = [13, 12, 16, 14, 15, 17];

    try {
      await Promise.all(
        lightsToDisconnect.map(async (lightId) => {
          await axios.put(
            `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
            { on: false }
          );
        })
      );
      fetchData();
      setIsAllLightsConnected(false);
    } catch (error) {
      console.error('Error disconnecting lights:', error);
    }
  };

  const changeTemperature = async () => {
    try {
      const calculatedTemperature = Math.round((temperature / 100) * 500);
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { ct: calculatedTemperature }
      );
      fetchData();
      openLight();
    } catch (error) {
      console.error('Error changing temperature:', error);
    }
  };

  const changeSaturation = async () => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { sat: saturation }
      );
      fetchData();
      openLight();
    } catch (error) {
      console.error('Error changing saturation:', error);
    }
  };

  const colorCycle = async () => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { effect: 'colorloop' }
      );
    } catch (error) {
      console.error('Error starting color cycle:', error);
    }
  };

  const emergencyAlert = async (color) => {
    try {
      const calculatedColor = color === 'green' ? 25500 : 0;
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { on: true, ct: calculatedColor }
      );
    } catch (error) {
      console.error('Error setting emergency alert:', error);
    }
  };

  const handleRangeChange = (slider, value) => {
    if (slider === 'brightness') {
      setBrightness(value);
      changeBrightness();
    } else if (slider === 'color') {
      setColor(value);
      changeColor();
    } else if (slider === 'saturation') {
      setSaturation(value);
      changeSaturation();
    } else if (slider === 'temperature') {
      setTemperature(value);
      changeTemperature();
    }

    openLight();
  };

  const openLight = async () => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { on: true }
      );
      fetchData();
    } catch (error) {
      console.error('Error opening light:', error);
    }
  };

  return (
    
    <div className="app">
      
      <div className="navbar">
        <h1 className="text-start main-title">
          Welcome! <FontAwesomeIcon icon={faCarBattery} />
        </h1>
      </div>
      <div className="menu">
        <div className="card">
          <button onClick={toggleLight} className={`button ${isLightOn ? 'on' : 'off'}`}>
            {isLightOn ? 'Turn Off' : 'Turn On'}
          </button>
        </div>
        <div className="card">
          <button
            onClick={isAllLightsConnected ? disconnectAllLights : connectAllLights}
            className="button"
          >
            {isAllLightsConnected ? 'Disconnect All Lights' : 'Connect All Lights'}
          </button>
        </div>
        <div className="card">
          <label htmlFor="slider1">Brightness:</label>
          <div className="progress-bar">
            <div className="progress-fill" style={{ width: `${brightness}%` }}>
              <span>{brightness}%</span>
            </div>
          </div>
          <input
            type="range"
            id="slider1"
            name="slider1"
            min="0"
            max="100"
            value={brightness}
            onChange={(e) => handleRangeChange('brightness', e.target.value)}
          />
        </div>
        <div className="card">
          <label htmlFor="slider2">Color:</label>
          <div className="progress-bar">
            <div className="progress-fill" style={{ width: `${color}%` }}>
              <span>{color}%</span>
            </div>
          </div>
          <input
            type="range"
            id="slider2"
            name="slider2"
            min="0"
            max="100"
            value={color}
            onChange={(e) => handleRangeChange('color', e.target.value)}
          />
        </div>
        <div className="card">
          <label htmlFor="slider3">Saturation:</label>
          <div className="progress-bar">
            <div className="progress-fill" style={{ width: `${saturation}%` }}>
              <span>{saturation}%</span>
            </div>
          </div>
          <input
            type="range"
            id="slider3"
            name="slider3"
            min="0"
            max="100"
            value={saturation}
            onChange={(e) => handleRangeChange('saturation', e.target.value)}
          />
        </div>
        <div className="card">
          <label htmlFor="slider4">Temperature:</label>
          <div className="progress-bar">
            <div className="progress-fill" style={{ width: `${temperature}%` }}>
              <span>{temperature}%</span>
            </div>
          </div>
          <input
            type="range"
            id="slider4"
            name="slider4"
            min="0"
            max="100"
            value={temperature}
            onChange={(e) => handleRangeChange('temperature', e.target.value)}
          />
        </div>
        <div className="card">
          <button onClick={randomColor} className="button">
            Random Color
          </button>
        </div>
        <div className="card">
          <button onClick={colorCycle} className="button">
            Color Cycle
          </button>
        </div>
        <div className="card">
          <button onClick={() => emergencyAlert('green')} className="button">
            Emergency Alert (Green)
          </button>
        </div>
        <div className="card">
          <button onClick={() => emergencyAlert('red')} className="button">
            Emergency Alert (Red)
            
          </button>
        </div>
        
      </div>
    </div>
  );
};

export default App;
