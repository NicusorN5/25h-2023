// // HueControl.js

// import React, { useState, useEffect } from 'react';
// import axios from 'axios';
// import './HueControl.css';


// const HueControl = () => {
//   const [lights, setLights] = useState([]);

//   useEffect(() => {
//     const fetchData = async () => {
//       try {
//         const response = await axios.get(
//           'http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/lights'
//         );
//         setLights(Object.values(response.data));
//       } catch (error) {
//         console.error('Error fetching lights:', error);
//       }
//     };

//     fetchData();
//   }, []);

//   const toggleLight = async (lightId, isOn) => {
//     try {
//       await axios.put(
//         `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
//         { on: !isOn }
//       );
//       // Update the state after successfully toggling the light
//       setLights((prevLights) =>
//         prevLights.map((light) =>
//           light.id === lightId ? { ...light, state: { on: !isOn } } : light
//         )
//       );
//     } catch (error) {
//       console.error('Error toggling light:', error);
//     }
//   };

//   const changeBrightness = async (lightId, brightness) => {
//     try {
//       await axios.put(
//         `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
//         { bri: brightness }
//       );
//       // Update the state after successfully changing brightness
//       setLights((prevLights) =>
//         prevLights.map((light) =>
//           light.id === lightId ? { ...light, state: { ...light.state, bri: brightness } } : light
//         )
//       );
//     } catch (error) {
//       console.error('Error changing brightness:', error);
//     }
//   };

//   const changeColor = async (lightId, color) => {
//     try {
//       await axios.put(
//         `http://192.168.0.10/api/nT3-GptvjYpdzarNevlY993gwFakZTOzwZuvifYp/lights/${lightId}/state`,
//         { hue: color }
//       );
//       // Update the state after successfully changing color
//       setLights((prevLights) =>
//         prevLights.map((light) =>
//           light.id === lightId ? { ...light, state: { ...light.state, hue: color } } : light
//         )
//       );
//     } catch (error) {
//       console.error('Error changing color:', error);
//     }
//   };

//   return (
//     <div className="hue-dashboard">
//       <h1 className="hue-title">Philips Hue Control Interface</h1>
//       <ul>
//         {lights.map((light) => (
//           <li key={light.id}>
//             <div className="light-info">
//               <div>{light.name}</div>
//               <div>Status: {light.state.on ? 'On' : 'Off'}</div>
//             </div>
//             <div className="light-controls">
//               <button onClick={() => toggleLight(light.id, light.state.on)}>
//                 {light.state.on ? 'Turn Off' : 'Turn On'}
//               </button>
//               <div className="brightness-control">
//                 <label>Brightness:</label>
//                 <input
//                   type="range"
//                   min="1"
//                   max="254"
//                   value={light.state.bri || 0}
//                   onChange={(e) => changeBrightness(light.id, parseInt(e.target.value))}
//                 />
//               </div>
              
//               <div className="color-control">
//                 <label>Color:</label>
//                 <input
//                   type="range"
//                   min="0"
//                   max="65535"
//                   value={light.state.hue || 0}
//                   onChange={(e) => changeColor(light.id, parseInt(e.target.value))}
//                 />
//               </div>
//               <div>
//             <li>
//           </li>
//         ))}
//       </ul>
//     </div>
//   );
// };

// export default HueControl;
