// CoolPanel.js

import React from 'react';
import './CoolPanel.css';

function CoolPanel({ children }) {
  return (
    <div className="cool-panel">
      {children}
    </div>
  );
}

export default CoolPanel;
