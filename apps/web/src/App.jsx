import React from 'react';
import { Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import Dashboard from './pages/Dashboard';
import Patients from './pages/Patients';
import Doctors from './pages/Doctors';

// Mock Pages for now
const Reports = () => <div className="glass-panel" style={{ padding: '32px', flex: 1 }}><h1>Reports</h1></div>;
const Settings = () => <div className="glass-panel" style={{ padding: '32px', flex: 1 }}><h1>Settings</h1></div>;

function App() {
  return (
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<Dashboard />} />
        <Route path="patients" element={<Patients />} />
        <Route path="doctors" element={<Doctors />} />
        <Route path="reports" element={<Reports />} />
        <Route path="settings" element={<Settings />} />
      </Route>
    </Routes>
  );
}

export default App;
