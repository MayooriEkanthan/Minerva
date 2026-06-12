import React from 'react';
import { MoreVertical, Mail, Filter } from 'lucide-react';

export default function Patients() {
  const patients = [
    { id: 'PAT-1042', name: 'Emily White', email: 'emily.w@example.com', joined: 'Oct 24, 2025', status: 'Active' },
    { id: 'PAT-1043', name: 'Sarah Johnson', email: 'sarah.j@example.com', joined: 'Oct 23, 2025', status: 'Inactive' },
    { id: 'PAT-1044', name: 'Jessica Chen', email: 'jess.chen@example.com', joined: 'Oct 22, 2025', status: 'Active' },
    { id: 'PAT-1045', name: 'Amanda Davis', email: 'amanda.d@example.com', joined: 'Oct 20, 2025', status: 'Active' },
    { id: 'PAT-1046', name: 'Luna Smith', email: 'luna.s@example.com', joined: 'Oct 19, 2025', status: 'Active' },
  ];

  return (
    <div style={containerStyle}>
      <div style={headerRowStyle}>
        <div>
          <h1 style={titleStyle}>Patients Management</h1>
          <p style={subtitleStyle}>View and manage all registered patients on the platform.</p>
        </div>
        <button style={filterButtonStyle}>
          <Filter size={16} />
          <span>Filter</span>
        </button>
      </div>

      <div className="glass-panel" style={tableContainerStyle}>
        <table style={tableStyle}>
          <thead>
            <tr>
              <th style={thStyle}>Patient ID</th>
              <th style={thStyle}>Name</th>
              <th style={thStyle}>Email</th>
              <th style={thStyle}>Joined Date</th>
              <th style={thStyle}>Status</th>
              <th style={{...thStyle, textAlign: 'right'}}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {patients.map((p, i) => (
              <tr key={p.id} style={{ borderBottom: i === patients.length - 1 ? 'none' : '1px solid rgba(0,0,0,0.05)' }}>
                <td style={tdStyle}>{p.id}</td>
                <td style={{...tdStyle, fontWeight: 600}}>{p.name}</td>
                <td style={{...tdStyle, color: '#6B7280'}}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    <Mail size={14} /> {p.email}
                  </div>
                </td>
                <td style={tdStyle}>{p.joined}</td>
                <td style={tdStyle}>
                  <span style={{
                    padding: '4px 12px',
                    borderRadius: '12px',
                    fontSize: '12px',
                    fontWeight: 500,
                    backgroundColor: p.status === 'Active' ? '#D1FAE5' : '#F3F4F6',
                    color: p.status === 'Active' ? '#059669' : '#4B5563',
                  }}>
                    {p.status}
                  </span>
                </td>
                <td style={{...tdStyle, textAlign: 'right'}}>
                  <button style={actionButtonStyle}>
                    <MoreVertical size={16} color="#6B7280" />
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

const containerStyle = {
  display: 'flex',
  flexDirection: 'column',
  width: '100%',
};

const headerRowStyle = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'flex-start',
  marginBottom: '32px',
};

const titleStyle = {
  fontSize: '28px',
  fontWeight: 'bold',
  color: 'var(--secondary)',
  marginBottom: '8px',
};

const subtitleStyle = {
  fontSize: '14px',
  color: '#6B7280',
};

const filterButtonStyle = {
  display: 'flex',
  alignItems: 'center',
  gap: '8px',
  padding: '8px 16px',
  backgroundColor: 'white',
  border: '1px solid rgba(0,0,0,0.1)',
  borderRadius: '8px',
  color: 'var(--secondary)',
  fontWeight: 500,
  fontSize: '14px',
};

const tableContainerStyle = {
  width: '100%',
  overflow: 'hidden',
};

const tableStyle = {
  width: '100%',
  borderCollapse: 'collapse',
  textAlign: 'left',
};

const thStyle = {
  padding: '16px 24px',
  fontSize: '12px',
  fontWeight: 600,
  color: '#6B7280',
  textTransform: 'uppercase',
  letterSpacing: '0.05em',
  borderBottom: '1px solid rgba(0,0,0,0.1)',
  backgroundColor: 'rgba(255,255,255,0.3)',
};

const tdStyle = {
  padding: '20px 24px',
  fontSize: '14px',
  color: 'var(--secondary)',
};

const actionButtonStyle = {
  background: 'transparent',
  border: 'none',
  padding: '8px',
  cursor: 'pointer',
  borderRadius: '50%',
};
