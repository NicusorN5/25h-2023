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
  const [brightnessOrColor, setBrightnessOrColor] = useState('brightness');
  const [rangePercent, setRangePercent] = useState(50);

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
    } catch (error) {
      console.error('Error fetching lights:', error);
    }
  };

  const toggleLight = async () => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { on: !isLightOn }
      );
      // Update the state after successfully toggling the light
      fetchData();
    } catch (error) {
      console.error('Error toggling light:', error);
    }
  };

  const changeBrightnessOrColor = async () => {
    try {
      const value = Math.round((rangePercent / 100) * (brightnessOrColor === 'brightness' ? 254 : 65535));
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { [brightnessOrColor === 'brightness' ? 'bri' : 'hue']: value }
      );
      // Update the state after successfully changing brightness or color
      fetchData();
      // Open the light when changing brightness or color
      openLight();
    } catch (error) {
      console.error('Error changing brightness or color:', error);
    }
  };

  const randomColor = async () => {
    try {
      const calculatedColor = Math.floor(Math.random() * 65536);
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { hue: calculatedColor, sat: 255 } // Ensure maximum saturation for vivid colors
      );
      // Update the state after successfully changing color
      fetchData();
      // Open the light when selecting random color
      openLight();
    } catch (error) {
      console.error('Error changing color:', error);
    }
  };

  const connectAllLights = async () => {
    const lightsToConnect = [13, 12, 16, 14, 15, 17]; // Add or modify the light IDs as needed

    try {
      await Promise.all(
        lightsToConnect.map(async (lightId) => {
          await axios.put(
            `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
            { on: true }
          );
        })
      );

      // Update the state after successfully connecting all lights
      fetchData();
      setIsAllLightsConnected(true);
    } catch (error) {
      console.error('Error connecting lights:', error);
    }
  };

  const disconnectAllLights = async () => {
    const lightsToDisconnect = [13, 12, 16, 14, 15, 17]; // Add or modify the light IDs as needed

    try {
      await Promise.all(
        lightsToDisconnect.map(async (lightId) => {
          await axios.put(
            `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
            { on: false }
          );
        })
      );

      // Update the state after successfully disconnecting all lights
      fetchData();
      setIsAllLightsConnected(false);
    } catch (error) {
      console.error('Error disconnecting lights:', error);
    }
  };

  const handleRangeChange = (value) => {
    setRangePercent(value);
    // Open the light when changing color or brightness
    openLight();
  };

  const openLight = async () => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { on: true }
      );
      // Update the state after successfully opening the light
      fetchData();
    } catch (error) {
      console.error('Error opening light:', error);
    }
  };

  return (
    <div className="app">
      <div className="navbar">
        <h1 className="text-start main-title">Welcome! <FontAwesomeIcon icon={faCarBattery} /></h1>
      </div>
      <div className="menu">
        <div className="card">
          <button onClick={toggleLight} className="button">
            {isLightOn ? 'Turn Off' : 'Turn On'}
          </button>
        </div>
        <div className="card">
          <button onClick={isAllLightsConnected ? disconnectAllLights : connectAllLights} className="button">
            {isAllLightsConnected ? 'Disconnect All Lights' : 'Connect All Lights'}
          </button>
        </div>
        <div className="card">
          <label htmlFor="slider">Brightness/Color:</label>
          <div className="progress-bar">
            <div
              className="progress-fill"
              style={{ width: `${rangePercent}%` }}
            >
              <span>{rangePercent}%</span>
            </div>
          </div>
          <input
            type="range"
            id="slider"
            name="slider"
            min="0"
            max="100"
            value={rangePercent}
            onChange={(e) => handleRangeChange(e.target.value)}
          />
        </div>
        <div className="card">
          <button onClick={randomColor} className="button">Random Color</button>
        </div>
        <div className="card">
          <button onClick={() => {/* Add logic for color cycle or animation */}} className="button">Color Cycle</button>
        </div>
      </div>
      <div className="footer">
        {/* Your footer content here */}
      </div>
    </div>
  );
};

export default App;
