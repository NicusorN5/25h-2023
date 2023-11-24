import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCarBattery } from '@fortawesome/free-solid-svg-icons';
import './App.css';

const API_BASE_URL =
  'http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights';

const App = () => {
  const [lights, setLights] = useState([]);
  const [selectedLightId, setSelectedLightId] = useState(16);
  const [isLightOn, setIsLightOn] = useState(false);
  const [isAllLightsConnected, setIsAllLightsConnected] = useState(false);
  const [brightness, setBrightness] = useState(50);
  const [color, setColor] = useState(50);
  const [saturation, setSaturation] = useState(50);
  const [temperature, setTemperature] = useState(50);
  const [isColorCycling, setIsColorCycling] = useState(false);

  useEffect(() => {
    fetchData();
  }, [selectedLightId]);

  const fetchData = async () => {
    try {
      const response = await axios.get(API_BASE_URL);
      const lightsData = Object.values(response.data);
      setLights(lightsData);

      const selectedLight = lightsData.find((light) => light.id === selectedLightId);
      if (selectedLight) {
        setIsLightOn(selectedLight.state?.on || false);
        setBrightness(selectedLight.state?.bri || 50);
        setColor(
          selectedLight.state?.hue
            ? Math.round((selectedLight.state.hue / 65535) * 100)
            : 50
        );
        setSaturation(selectedLight.state?.sat || 50);
        setTemperature(
          selectedLight.state?.ct ? Math.round((selectedLight.state.ct / 500) * 100) : 50
        );
      }
    } catch (error) {
      console.error('Error fetching lights:', error);
    }
  };


  const toggleLight = () => {
    let newState;
  
    // Se la luce è accesa, spegnila; altrimenti, accendila con le impostazioni desiderate
    if (isLightOn) {
      newState = { on: false };
    } else {
      newState = { on: true, xy: [0.313, 0.329], ct: 366 };
    }
  
    axios
      .put(`${API_BASE_URL}/${selectedLightId}/state`, newState)
      .then(() => {
        fetchData();
        setIsLightOn(!isLightOn);
      })
      .catch((error) => {
        console.error('Error toggling light:', error);
      });
  };  

  const changeState = async (state) => {
    try {
      await axios.put(`${API_BASE_URL}/${selectedLightId}/state`, state);
      fetchData();
      openLight();
    } catch (error) {
      console.error(`Error changing state: ${JSON.stringify(state)}`, error);
    }
  };

  const changeBrightness = () => changeState({ bri: Math.round((brightness / 100) * 254) });
  const changeColor = () => changeState({ hue: Math.round((color / 100) * 65535) });
  const changeTemperature = () => changeState({ ct: Math.round((temperature / 100) * 500) });
  const changeSaturation = () => changeState({ sat: saturation });

  const randomColor = async () => {
    const calculatedColor = Math.floor(Math.random() * 65536);
    await changeState({ hue: calculatedColor, sat: 255 });
  };

  const handleConnectDisconnectAllLights = async (lightsArray, isConnected) => {
    try {
      await Promise.all(
        lightsArray.map(async (lightId) => {
          await axios.put(`${API_BASE_URL}/${lightId}/state`, { on: isConnected });
        })
      );
      fetchData();
      setIsAllLightsConnected(isConnected);
    } catch (error) {
      console.error(`Error ${isConnected ? 'connecting' : 'disconnecting'} lights:`, error);
    }
  };

  const connectAllLights = () =>
    handleConnectDisconnectAllLights([13, 12, 16, 14, 15, 17], true);
  const disconnectAllLights = () =>
    handleConnectDisconnectAllLights([13, 12, 16, 14, 15, 17], false);

  const toggleColorCycle = async () => {
    try {
      const effect = isColorCycling ? 'none' : 'colorloop';
      await changeState({ effect });
      setIsColorCycling(!isColorCycling);
    } catch (error) {
      console.error('Error toggling color cycle:', error);
    }
  };

const resetLight = async () => {
  try {
    await axios.put(`${API_BASE_URL}/${selectedLightId}/state`, { on: false });
    fetchData();
    setIsAllLightsConnected(false);
  } catch (error) {
    console.error(error);
  }
};

const startLight = async () => {
  try {
    await axios.put(`${API_BASE_URL}/${selectedLightId}/state`, { on: true });
    fetchData();
    setIsAllLightsConnected(true);
  } catch (error) {
    console.error(error);
  }
};

  const handleEmergencyAlert = async (color) => {
    try {
      const calculatedColor = color === 'green' ? 25500 : 0;
      await changeState({ on: true, ct: calculatedColor });
    } catch (error) {
      console.error('Error setting emergency alert:', error);
    }
  };  

  const handleRangeChange = (slider, value) => {
    switch (slider) {
      case 'brightness':
        setBrightness(value);
        changeBrightness();
        break;
      case 'color':
        setColor(value);
        changeColor();
        break;
      case 'saturation':
        setSaturation(value);
        changeSaturation();
        break;
      case 'temperature':
        setTemperature(value);
        changeTemperature();
        break;
      default:
        break;
    }

    openLight();
  };

  const openLight = () => changeState({ on: true });

  return (
    <div className="app">
      <div className="navbar">
        <h1 className="text-start main-title">
          Welcome! <FontAwesomeIcon icon={faCarBattery} />
        </h1>
      </div>
      <div className="menu">
        <div className="card">
          <button
            onClick={toggleLight}
            className={`button ${isLightOn ? 'on' : 'off'}`}
          >
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
          <button onClick={toggleColorCycle} className="button">
            {isColorCycling ? 'Stop Color Cycle' : 'Start Color Cycle'}
          </button>
        </div>
       
        <div className="card">
        <button onClick={() => handleEmergencyAlert('red')} className="button">
            Emergency Alert (Red)
          </button>
          <button onClick={resetLight} className="button">
            Reset Light
          </button>
        </div>
        <div className="card">
          <button onClick={() => handleEmergencyAlert('green')} className="button">
            Emergency Alert (Green)
            </button>
          <button onClick={startLight} className="button">
            Start Light
          </button>
        </div>
      </div>
    </div>
  );
};

export default App;
