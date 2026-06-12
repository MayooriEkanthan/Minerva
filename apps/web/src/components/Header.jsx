import React from 'react';
import { Search, Bell, ChevronDown } from 'lucide-react';

export default function Header() {
  return (
    <header style={headerStyle} className="glass-panel animate-fade-in">
      <div style={searchContainerStyle}>
        <Search size={20} color="#9CA3AF" />
        <input 
          type="text" 
          placeholder="Search patients, doctors, or reports..." 
          style={searchInputStyle}
        />
      </div>

      <div style={actionsContainerStyle}>
        <button style={iconButtonStyle}>
          <div style={badgeStyle}></div>
          <Bell size={20} color="var(--secondary)" />
        </button>

        <div style={dividerStyle}></div>

        <div style={profileContainerStyle}>
          <div style={avatarStyle}>
            <span style={{ color: 'var(--primary)', fontWeight: 'bold' }}>A</span>
          </div>
          <div style={profileInfoStyle}>
            <span style={profileNameStyle}>Admin User</span>
            <span style={profileRoleStyle}>Super Admin</span>
          </div>
          <ChevronDown size={16} color="#9CA3AF" />
        </div>
      </div>
    </header>
  );
}

const headerStyle = {
  height: '80px',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
  padding: '0 32px',
  marginBottom: '32px',
};

const searchContainerStyle = {
  display: 'flex',
  alignItems: 'center',
  background: 'rgba(255, 255, 255, 0.5)',
  padding: '12px 24px',
  borderRadius: '16px',
  width: '400px',
  border: '1px solid rgba(255, 255, 255, 0.8)',
};

const searchInputStyle = {
  border: 'none',
  background: 'transparent',
  outline: 'none',
  width: '100%',
  marginLeft: '12px',
  fontSize: '14px',
  color: 'var(--secondary)',
};

const actionsContainerStyle = {
  display: 'flex',
  alignItems: 'center',
  gap: '24px',
};

const iconButtonStyle = {
  background: 'rgba(255, 255, 255, 0.5)',
  border: '1px solid rgba(255, 255, 255, 0.8)',
  width: '48px',
  height: '48px',
  borderRadius: '12px',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  position: 'relative',
  cursor: 'pointer',
};

const badgeStyle = {
  position: 'absolute',
  top: '12px',
  right: '14px',
  width: '8px',
  height: '8px',
  background: 'var(--primary)',
  borderRadius: '50%',
};

const dividerStyle = {
  width: '1px',
  height: '32px',
  background: 'rgba(0,0,0,0.1)',
};

const profileContainerStyle = {
  display: 'flex',
  alignItems: 'center',
  gap: '12px',
  cursor: 'pointer',
};

const avatarStyle = {
  width: '40px',
  height: '40px',
  borderRadius: '50%',
  background: 'var(--primary-light)',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  border: '2px solid white',
};

const profileInfoStyle = {
  display: 'flex',
  flexDirection: 'column',
  marginRight: '8px',
};

const profileNameStyle = {
  fontSize: '14px',
  fontWeight: 'bold',
  color: 'var(--secondary)',
};

const profileRoleStyle = {
  fontSize: '12px',
  color: '#6B7280',
};
