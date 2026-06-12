import React from 'react';
import { NavLink } from 'react-router-dom';
import { 
  LayoutDashboard, 
  Users, 
  Stethoscope, 
  BarChart3, 
  Settings,
  LogOut 
} from 'lucide-react';

export default function Sidebar() {
  const navItems = [
    { icon: LayoutDashboard, label: 'Dashboard', path: '/' },
    { icon: Users, label: 'Patients', path: '/patients' },
    { icon: Stethoscope, label: 'Doctors', path: '/doctors' },
    { icon: BarChart3, label: 'Reports', path: '/reports' },
    { icon: Settings, label: 'Settings', path: '/settings' },
  ];

  return (
    <aside style={sidebarStyle} className="glass-panel animate-fade-in">
      <div style={logoContainerStyle}>
        <div style={logoIconStyle}>
          <span style={{ color: 'white', fontWeight: 'bold', fontSize: '20px' }}>M</span>
        </div>
        <h1 style={logoTextStyle}>Minerva<span style={{ color: 'var(--primary)' }}>Admin</span></h1>
      </div>

      <nav style={navStyle}>
        {navItems.map((item) => (
          <NavLink
            key={item.path}
            to={item.path}
            style={({ isActive }) => ({
              ...linkStyle,
              background: isActive ? 'rgba(255, 77, 141, 0.1)' : 'transparent',
              color: isActive ? 'var(--primary)' : 'var(--secondary)',
              borderRight: isActive ? '3px solid var(--primary)' : '3px solid transparent',
            })}
          >
            <item.icon size={20} style={{ marginRight: '16px' }} />
            <span style={{ fontWeight: 500 }}>{item.label}</span>
          </NavLink>
        ))}
      </nav>

      <div style={bottomContainerStyle}>
        <button style={logoutButtonStyle}>
          <LogOut size={20} style={{ marginRight: '16px' }} />
          <span style={{ fontWeight: 500 }}>Logout</span>
        </button>
      </div>
    </aside>
  );
}

// Inline styles for pure React approach without Tailwind class dependency
const sidebarStyle = {
  width: '280px',
  height: 'calc(100vh - 48px)',
  margin: '24px',
  display: 'flex',
  flexDirection: 'column',
  position: 'fixed',
  left: 0,
  top: 0,
  overflow: 'hidden',
};

const logoContainerStyle = {
  padding: '32px 24px',
  display: 'flex',
  alignItems: 'center',
  gap: '12px',
};

const logoIconStyle = {
  width: '40px',
  height: '40px',
  background: 'var(--primary)',
  borderRadius: '12px',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  boxShadow: '0 4px 12px rgba(255, 77, 141, 0.3)',
};

const logoTextStyle = {
  fontSize: '24px',
  fontWeight: 'bold',
  letterSpacing: '-0.5px',
};

const navStyle = {
  flex: 1,
  display: 'flex',
  flexDirection: 'column',
  gap: '8px',
  padding: '0 16px',
  marginTop: '24px',
};

const linkStyle = {
  display: 'flex',
  alignItems: 'center',
  padding: '16px',
  textDecoration: 'none',
  borderRadius: '12px',
  transition: 'all 0.2s ease',
};

const bottomContainerStyle = {
  padding: '24px',
  borderTop: '1px solid rgba(0,0,0,0.05)',
};

const logoutButtonStyle = {
  display: 'flex',
  alignItems: 'center',
  width: '100%',
  padding: '16px',
  background: 'transparent',
  border: 'none',
  color: '#EF4444',
  borderRadius: '12px',
  cursor: 'pointer',
};
