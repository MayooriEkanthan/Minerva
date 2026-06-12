import React from 'react';
import { Outlet } from 'react-router-dom';
import Sidebar from './Sidebar';
import Header from './Header';

export default function Layout() {
  return (
    <div style={containerStyle}>
      <Sidebar />
      <div style={mainContentWrapperStyle}>
        <Header />
        <main style={mainStyle} className="animate-fade-in">
          <Outlet />
        </main>
      </div>
    </div>
  );
}

const containerStyle = {
  display: 'flex',
  minHeight: '100vh',
  width: '100%',
};

const mainContentWrapperStyle = {
  flex: 1,
  marginLeft: '328px', // Sidebar width (280) + margin (24 * 2)
  padding: '24px 24px 24px 0',
  display: 'flex',
  flexDirection: 'column',
};

const mainStyle = {
  flex: 1,
  display: 'flex',
  flexDirection: 'column',
};
