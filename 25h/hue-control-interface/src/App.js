// App.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCarBattery, faLightbulb } from '@fortawesome/free-solid-svg-icons';
import Device from "./components/Device.js";

const App = () => {
  const [lights, setLights] = useState([]);
  const [selectedLightId, setSelectedLightId] = useState(16);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await axios.get(
        'http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights'
      );
      setLights(Object.values(response.data));
    } catch (error) {
      console.error('Error fetching lights:', error);
    }
  };

  const toggleLight = async (isOn) => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { on: !isOn }
      );
      // Update the state after successfully toggling the light
      fetchData();
    } catch (error) {
      console.error('Error toggling light:', error);
    }
  };

  const changeBrightness = async (brightness) => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { bri: brightness }
      );
      // Update the state after successfully changing brightness
      fetchData();
    } catch (error) {
      console.error('Error changing brightness:', error);
    }
  };

  const changeColor = async (color) => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { hue: color }
      );
      // Update the state after successfully changing color
      fetchData();
    } catch (error) {
      console.error('Error changing color:', error);
    }
  };

  const randomColor = async () => {
    try {
      const color = Math.floor(Math.random() * 65536);
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { hue: color, sat: 255 } // Ensure maximum saturation for vivid colors
      );
      // Update the state after successfully changing color
      fetchData();
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
    } catch (error) {
      console.error('Error connecting lights:', error);
    }
  };

  const resetLights = async () => {
    try {
      await axios.put(
        `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${selectedLightId}/state`,
        { on: false, bri: 254, hue: 0 }
      );
      // Update the state after successfully resetting the light
      fetchData();
    } catch (error) {
      console.error('Error resetting light:', error);
    }
  };

  const turnOffAllLights = async () => {
    const lightsToTurnOff = [13, 12, 16, 14, 15, 17]; // Add or modify the light IDs as needed
  
    try {
      await Promise.all(
        lightsToTurnOff.map(async (lightId) => {
          await axios.put(
            `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
            { on: false }
          );
        })
      );
      // Update the state after successfully turning off all lights
      fetchData();
    } catch (error) {
      console.error('Error turning off lights:', error);
    }

    
  };

  return (
    <div className="app">
      <div className="navbar">
        <h1 className="text-start main-title">Welcome! <FontAwesomeIcon icon={faCarBattery} /></h1>
      </div>
      <Device />
      <div className="menu">
        <div className="card">
          <button onClick={() => toggleLight(lights.find((light) => light.id === selectedLightId)?.state.on || false)} className="button">
            {lights.find((light) => light.id === selectedLightId)?.state.on ? 'Turn Off' : 'Turn On'}
          </button>
        </div>
        <div className="card">
          <button onClick={() => turnOffAllLights()} className="button">Turn Off All Lights</button>
        </div>
        <div className="card">
          <div className="brightness-control">
            <label>Brightness:</label>
            <input
              type="range"
              min="1"
              max="254"
              value={lights.find((light) => light.id === selectedLightId)?.state.bri || 0}
              onChange={(e) => changeBrightness(parseInt(e.target.value))}
            />
          </div>
        </div>
        <div className="card">
          <div className="color-control">
            <label>Color:</label>
            <input
              type="range"
              min="0"
              max="65535"
              value={lights.find((light) => light.id === selectedLightId)?.state.hue || 0}
              onChange={(e) => changeColor(parseInt(e.target.value))}
            />
          </div>
        </div>
        <div className="card">
          <button onClick={() => randomColor()} className="button">Random Color</button>
        </div>
        <div className="card">
          <button onClick={() => {/* Add logic for color cycle or animation */}} className="button">Color Cycle</button>
        </div>
        <div className="card">
          <button onClick={() => resetLights()} className="button">Reset</button>
        </div>
      </div>
      <div className="card">
        <button onClick={() => connectAllLights()} className="button">Connect All Lights</button>
      </div>
    </div>
  );
};

export default App;
