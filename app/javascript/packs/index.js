import React from 'react';
import { render } from 'react-dom';
import Provider from '../components/Provider';

document.addEventListener('DOMContentLoaded', () => {
  const mountingPoint = document.getElementById('#root');

  if (mountingPoint) {
    render(<Provider>👻</Provider>, mountingPoint);
  }
});
