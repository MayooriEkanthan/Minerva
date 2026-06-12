import React from 'react';
import { Check, X, FileText, ExternalLink } from 'lucide-react';

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
          <div key={doc.id} style={{
            ...cardStyle,
            borderBottom: i === doctors.length - 1 ? 'none' : '1px solid rgba(0,0,0,0.05)'
          }}>
            <div style={docInfoStyle}>
              <div style={avatarStyle}>
                <span style={{ color: 'var(--primary)', fontWeight: 'bold' }}>{doc.name.charAt(4)}</span>
              </div>
              <div>
                <h3 style={docNameStyle}>{doc.name}</h3>
                <p style={docSubStyle}>{doc.spec} • ID: {doc.id}</p>
              </div>
            </div>

            <div style={documentsStyle}>
              <div style={docLinkStyle}>
                <FileText size={14} /> Medical License ({doc.license}) <ExternalLink size={12} />
              </div>
              <div style={docLinkStyle}>
                <FileText size={14} /> Government ID <ExternalLink size={12} />
              </div>
            </div>

            <div style={statusStyle}>
              <span style={{
                padding: '4px 12px',
                borderRadius: '12px',
                fontSize: '12px',
                fontWeight: 500,
                backgroundColor: doc.status === 'Approved' ? '#D1FAE5' : doc.status === 'Rejected' ? '#FEE2E2' : '#FEF3C7',
                color: doc.status === 'Approved' ? '#059669' : doc.status === 'Rejected' ? '#DC2626' : '#D97706',
              }}>
                {doc.status}
              </span>
            </div>

            <div style={actionsStyle}>
              {doc.status === 'Pending Review' ? (
                <>
                  <button style={{...actionBtnStyle, color: '#DC2626', backgroundColor: '#FEE2E2'}}>
                    <X size={16} /> Reject
                  </button>
                  <button style={{...actionBtnStyle, color: 'white', backgroundColor: '#10C655'}}>
                    <Check size={16} /> Approve
                  </button>
                </>
              ) : (
                <button style={{...actionBtnStyle, color: '#6B7280', backgroundColor: '#F3F4F6'}}>
                  View Profile
                </button>
              )}
            </div>
          </div>
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

const cardStyle = {
  padding: '24px',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'space-between',
};

const docInfoStyle = {
  display: 'flex',
  alignItems: 'center',
  gap: '16px',
  flex: 1.5,
};

const avatarStyle = {
  width: '48px',
  height: '48px',
  borderRadius: '50%',
  background: 'var(--primary-light)',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  border: '2px solid white',
  fontSize: '18px',
};

const docNameStyle = {
  fontSize: '16px',
  fontWeight: 'bold',
  color: 'var(--secondary)',
  marginBottom: '4px',
};

const docSubStyle = {
  fontSize: '13px',
  color: '#6B7280',
};

const documentsStyle = {
  flex: 1.5,
  display: 'flex',
  flexDirection: 'column',
  gap: '8px',
};

const docLinkStyle = {
  display: 'flex',
  alignItems: 'center',
  gap: '6px',
  fontSize: '13px',
  color: 'var(--primary)',
  cursor: 'pointer',
  fontWeight: 500,
};

const statusStyle = {
  flex: 1,
  display: 'flex',
  justifyContent: 'center',
};

const actionsStyle = {
  flex: 1,
  display: 'flex',
  justifyContent: 'flex-end',
  gap: '8px',
};

const actionBtnStyle = {
  display: 'flex',
  alignItems: 'center',
  gap: '6px',
  padding: '8px 16px',
  border: 'none',
  borderRadius: '8px',
  fontSize: '13px',
  fontWeight: 600,
  cursor: 'pointer',
};
