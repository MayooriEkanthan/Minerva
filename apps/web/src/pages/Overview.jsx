import React from 'react'
import { Users, UserPlus, FileText, Activity } from 'lucide-react'

export default function Overview() {
  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-brand-dark">Dashboard Overview</h1>
        <p className="text-brand-textLight text-sm mt-1">Welcome back. Here is what's happening today.</p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <StatCard title="Total Patients" value="1,248" change="+12%" icon={<Users size={24} />} />
        <StatCard title="Active Doctors" value="156" change="+4%" icon={<Activity size={24} />} />
        <StatCard title="Pending Approvals" value="23" change="-2%" icon={<UserPlus size={24} />} />
        <StatCard title="Consultations" value="892" change="+18%" icon={<FileText size={24} />} />
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Chart Placeholder */}
        <div className="lg:col-span-2 glass rounded-2xl p-6 min-h-[400px] flex flex-col">
          <h2 className="text-lg font-bold text-brand-dark mb-4">Patient Acquisition</h2>
          <div className="flex-1 flex items-center justify-center border-2 border-dashed border-gray-200 rounded-xl bg-gray-50/50">
            <span className="text-gray-400 font-medium">Chart visualization will be implemented here</span>
          </div>
        </div>

        {/* Activity Feed Placeholder */}
        <div className="glass rounded-2xl p-6 flex flex-col">
          <h2 className="text-lg font-bold text-brand-dark mb-4">Recent Activity</h2>
          <div className="space-y-6 flex-1">
            <ActivityItem 
              title="Dr. Sarah Smith approved" 
              time="10 mins ago" 
              type="success"
            />
            <ActivityItem 
              title="New patient registered" 
              time="1 hour ago" 
              type="neutral"
            />
            <ActivityItem 
              title="Dr. Chen verification pending" 
              time="3 hours ago" 
              type="warning"
            />
            <ActivityItem 
              title="System backup completed" 
              time="Yesterday" 
              type="neutral"
            />
          </div>
        </div>
      </div>
    </div>
  )
}

function StatCard({ title, value, change, icon }) {
  const isPositive = change.startsWith('+');
  return (
    <div className="glass rounded-2xl p-6 hover:shadow-lg transition-shadow">
      <div className="flex justify-between items-start mb-4">
        <div className="p-3 bg-brand-pinkLight text-brand-pink rounded-xl">
          {icon}
        </div>
        <span className={`text-sm font-semibold px-2 py-1 rounded-full ${
          isPositive ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'
        }`}>
          {change}
        </span>
      </div>
      <div>
        <h3 className="text-gray-500 text-sm font-medium">{title}</h3>
        <p className="text-3xl font-bold text-brand-dark mt-1">{value}</p>
      </div>
    </div>
  )
}

function ActivityItem({ title, time, type }) {
  const dotColor = type === 'success' ? 'bg-green-500' : type === 'warning' ? 'bg-orange-500' : 'bg-blue-500';
  return (
    <div className="flex gap-4">
      <div className="flex flex-col items-center mt-1">
        <div className={`w-3 h-3 rounded-full ${dotColor}`}></div>
        <div className="w-[2px] h-full bg-gray-100 mt-2"></div>
      </div>
      <div className="pb-4">
        <p className="text-sm font-medium text-brand-dark">{title}</p>
        <p className="text-xs text-brand-textLight mt-1">{time}</p>
      </div>
    </div>
  )
}
