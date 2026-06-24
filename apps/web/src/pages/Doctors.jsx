import React from 'react';
import DoctorCard from '../components/DoctorCard';

export default function Doctors() {
  const doctors = [
    { id: 'DOC-501', name: 'Dr. Sarah Chen', spec: 'Dermatology', license: 'MD-19284', status: 'Pending Review' },
    { id: 'DOC-502', name: 'Dr. James Wilson', spec: 'General Physician', license: 'MD-99212', status: 'Pending Review' },
    { id: 'DOC-503', name: 'Dr. Michael Roberts', spec: 'Pediatrics', license: 'MD-33211', status: 'Approved' },
    { id: 'DOC-504', name: 'Dr. Emily White', spec: 'Orthopedics', license: 'MD-88123', status: 'Rejected' },
  ];

  return (
    <div style={containerStyle}>
      <div style={headerRowStyle}>
        <div>
          <h1 style={titleStyle}>Doctors Verification</h1>
          <p style={subtitleStyle}>Review and verify professional credentials for new practitioners.</p>
        </div>
      </div>

      <div className="glass-panel" style={listContainerStyle}>
        {doctors.map((doc, i) => (
          <DoctorCard key={doc.id} doc={doc} isLast={i === doctors.length - 1} />
        ))}
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

const listContainerStyle = {
  width: '100%',
  display: 'flex',
  flexDirection: 'column',
};
