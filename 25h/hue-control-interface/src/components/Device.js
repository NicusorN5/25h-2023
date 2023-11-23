import React, { useState, useEffect } from 'react';
import axios from 'axios';

export default function Device(props) {

    return (
        <div className="App">
        <button type="button" className="btn btn-primary">
           Play
        </button>
  
        <div className="mt-4">
          <label htmlFor="slider1">Slider 1:</label>
          <input type="range" id="slider1" name="slider1" min="0" max="100" />
  
          <label htmlFor="slider2">Slider 2:</label>
          <input type="range" id="slider2" name="slider2" min="0" max="100" />
        </div>
      </div>
    );
}