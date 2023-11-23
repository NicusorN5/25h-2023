// App.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';
import Device from "./components/Device.js";

const App = () => {
  const [lights, setLights] = useState([]);
  const [selectedLightId, setSelectedLightId] = useState(13);

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
        { hue: color }
      );
      // Update the state after successfully changing color
      fetchData();
    } catch (error) {
      console.error('Error changing color:', error);
    }
  };

  const connectAllLights = async () => {
    const validLights = lights.filter((light) => light.id !== selectedLightId && light.id >= 12 && light.id <= 24);
    try {
      await Promise.all(
        validLights.map(async (light) => {
          await axios.put(
            `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${light.id}/state`,
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
    const validLights = lights.filter((light) => light.id >= 12 && light.id <= 24);
    try {
      await Promise.all(
        validLights.map(async (light) => {
          await axios.put(
            `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${light.id}/state`,
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
      <h1 className="main-title">Philips Hue Control Interface</h1>
      <Device />
      <div className="light-settings">
        <div className="light-selector">
          <label>Select Light ID:</label>
          <select
            value={selectedLightId}
            onChange={(e) => setSelectedLightId(parseInt(e.target.value))}
          >
            {lights.map((light) => (
              <option key={light.id} value={light.id}>
                {light.id} - {light.name}
              </option>
            ))}
          </select>
        </div>
        <div className="light-controls">
          <button onClick={() => toggleLight(lights.find((light) => light.id === selectedLightId)?.state.on || false)}>
            {lights.find((light) => light.id === selectedLightId)?.state.on ? 'Turn Off' : 'Turn On'}
          </button>
          <button onClick={() => turnOffAllLights()}>Turn Off All Lights</button>
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
          <button onClick={() => randomColor()}>Random Color</button>
          <button onClick={() => resetLights()}>Reset</button>
        </div>
      </div>
      <div className="additional-controls">
        <button onClick={() => connectAllLights()}>Connect All Lights</button>
      </div>
    </div>
  );
};

export default App;
