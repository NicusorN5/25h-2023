import React, { useState } from 'react';
import './Device.css';

export default function Device(props) {
  const [rangePercent1, setRangePercent1] = useState(0);
  const [rangePercent2, setRangePercent2] = useState(0);

  const handleRangeChange = (sliderId, event) => {
    const value = event.target.value;
    if (sliderId === 1) {
      setRangePercent1(value);
    } else if (sliderId === 2) {
      setRangePercent2(value);
    }
  };

  return (
    <div className="App card-horizontal">
      <button type="button" className="btn btn-primary">
        Play
      </button>

      <div className="mt-4">
        <label htmlFor="slider1">Slider 1:</label>
        <div className="progress-bar">
          <div
            className="progress-fill"
            style={{ width: `${rangePercent1}%` }}
          >
            <span>{rangePercent1}%</span>
          </div>
        </div>
        <input
          type="range"
          id="slider1"
          name="slider1"
          min="0"
          max="100"
          value={rangePercent1}
          onChange={(e) => handleRangeChange(1, e)}
        />
      
        <label htmlFor="slider2">Slider 2:</label>
        <div className="progress-bar">
          <div
            className="progress-fill"
            style={{ width: `${rangePercent2}%` }}
          >
            <span>{rangePercent2}%</span>
          </div>
        </div>
        <input
          type="range"
          id="slider2"
          name="slider2"
          min="0"
          max="100"
          value={rangePercent2}
          onChange={(e) => handleRangeChange(2, e)}
        />
      </div>
    </div>
  );
}
