import React from 'react';
import { Users, UserPlus, Activity, TrendingUp } from 'lucide-react';

export default function Dashboard() {
  return (
    <div style={containerStyle}>
      <h1 style={titleStyle}>Platform Overview</h1>
      <p style={subtitleStyle}>Welcome back, Admin. Here's what's happening today.</p>

      <div style={statsGridStyle}>
        <StatCard 
          title="Total Patients" 
          value="12,450" 
          trend="+14%" 
          icon={Users} 
          color="#3B82F6" 
        />
        <StatCard 
          title="Pending Doctors" 
          value="48" 
          trend="+5" 
          icon={UserPlus} 
          color="#F59E0B" 
        />
        <StatCard 
          title="Active Consults" 
          value="312" 
          trend="Stable" 
          icon={Activity} 
          color="#10C655" 
        />
        <StatCard 
          title="Total Revenue" 
          value="$45,210" 
          trend="+22%" 
          icon={TrendingUp} 
          color="var(--primary)" 
        />
      </div>

      <div style={chartsGridStyle}>
        <div className="glass-panel" style={chartCardStyle}>
          <h2 style={chartTitleStyle}>Patient Registration Trend</h2>
          <div style={mockChartAreaStyle}>
            {/* Mock Chart Visualization */}
            <div style={barContainerStyle}>
              {[40, 60, 45, 80, 50, 90, 75].map((height, i) => (
                <div key={i} style={{...barStyle, height: `${height}%`}}></div>
              ))}
            </div>
            <div style={chartLabelsStyle}>
              <span>Mon</span><span>Tue</span><span>Wed</span><span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span>
            </div>
          </div>
        </div>
        
        <div className="glass-panel" style={chartCardStyle}>
          <h2 style={chartTitleStyle}>Recent Doctor Verifications</h2>
          <div style={mockListStyle}>
            {[
              { name: 'Dr. Sarah Chen', status: 'Pending Review', time: '10 mins ago' },
              { name: 'Dr. Michael Roberts', status: 'Approved', time: '1 hour ago' },
              { name: 'Dr. Emily White', status: 'Rejected', time: '3 hours ago' },
              { name: 'Dr. James Wilson', status: 'Pending Review', time: '5 hours ago' },
            ].map((item, i) => (
              <div key={i} style={listItemStyle}>
                <div>
                  <div style={{ fontWeight: 'bold', fontSize: '14px', color: 'var(--secondary)' }}>{item.name}</div>
                  <div style={{ fontSize: '12px', color: '#6B7280' }}>{item.time}</div>
                </div>
                <div style={{
                  fontSize: '12px',
                  fontWeight: 500,
                  padding: '4px 12px',
                  borderRadius: '12px',
                  backgroundColor: item.status === 'Approved' ? '#D1FAE5' : item.status === 'Rejected' ? '#FEE2E2' : '#FEF3C7',
                  color: item.status === 'Approved' ? '#059669' : item.status === 'Rejected' ? '#DC2626' : '#D97706',
                }}>
                  {item.status}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

function StatCard({ title, value, trend, icon: Icon, color }) {
  return (
    <div className="glass-panel" style={statCardStyle}>
      <div style={statHeaderStyle}>
        <span style={statTitleStyle}>{title}</span>
        <div style={{...iconWrapperStyle, backgroundColor: `${color}15`, color: color}}>
          <Icon size={20} />
        </div>
      </div>
      <div style={statValueContainerStyle}>
        <span style={statValueStyle}>{value}</span>
        <span style={{...trendStyle, color: trend.startsWith('+') ? '#10C655' : '#6B7280'}}>
          {trend}
        </span>
      </div>
    </div>
  );
}

// Inline Styles
const containerStyle = {
  display: 'flex',
  flexDirection: 'column',
  width: '100%',
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
  marginBottom: '32px',
};

const statsGridStyle = {
  display: 'grid',
  gridTemplateColumns: 'repeat(4, 1fr)',
  gap: '24px',
  marginBottom: '32px',
};

const statCardStyle = {
  padding: '24px',
  display: 'flex',
  flexDirection: 'column',
};

const statHeaderStyle = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  marginBottom: '16px',
};

const statTitleStyle = {
  fontSize: '14px',
  fontWeight: 500,
  color: '#6B7280',
};

const iconWrapperStyle = {
  width: '40px',
  height: '40px',
  borderRadius: '12px',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
};

const statValueContainerStyle = {
  display: 'flex',
  alignItems: 'baseline',
  gap: '12px',
};

const statValueStyle = {
  fontSize: '32px',
  fontWeight: 'bold',
  color: 'var(--secondary)',
};

const trendStyle = {
  fontSize: '14px',
  fontWeight: 500,
};

const chartsGridStyle = {
  display: 'grid',
  gridTemplateColumns: '2fr 1fr',
  gap: '24px',
};

const chartCardStyle = {
  padding: '24px',
  display: 'flex',
  flexDirection: 'column',
};

const chartTitleStyle = {
  fontSize: '16px',
  fontWeight: 'bold',
  color: 'var(--secondary)',
  marginBottom: '24px',
};

const mockChartAreaStyle = {
  flex: 1,
  minHeight: '250px',
  display: 'flex',
  flexDirection: 'column',
};

const barContainerStyle = {
  flex: 1,
  display: 'flex',
  alignItems: 'flex-end',
  justifyContent: 'space-between',
  padding: '0 20px',
  borderBottom: '1px solid rgba(0,0,0,0.1)',
};

const barStyle = {
  width: '40px',
  backgroundColor: 'var(--primary)',
  borderRadius: '8px 8px 0 0',
  opacity: 0.8,
  transition: 'height 1s ease',
};

const chartLabelsStyle = {
  display: 'flex',
  justifyContent: 'space-between',
  padding: '16px 20px 0 20px',
  color: '#6B7280',
  fontSize: '12px',
  fontWeight: 500,
};

const mockListStyle = {
  display: 'flex',
  flexDirection: 'column',
  gap: '16px',
};

const listItemStyle = {
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center',
  paddingBottom: '16px',
  borderBottom: '1px solid rgba(0,0,0,0.05)',
};
