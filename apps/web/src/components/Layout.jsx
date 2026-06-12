import React from 'react'
import { Outlet, NavLink } from 'react-router-dom'
import { LayoutDashboard, Users, UserRoundCog, Settings, Bell, Search, HeartPulse } from 'lucide-react'

export default function Layout() {
  return (
    <div className="flex h-screen w-full bg-brand-gray overflow-hidden font-sans">
      {/* Sidebar */}
      <aside className="w-64 glass flex flex-col border-r border-gray-200">
        <div className="h-20 flex items-center px-8 border-b border-gray-100">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-full bg-brand-pink flex items-center justify-center">
              <HeartPulse className="text-white" size={24} />
            </div>
            <span className="text-xl font-bold text-brand-dark tracking-tight">Minerva</span>
          </div>
        </div>
        
        <nav className="flex-1 px-4 py-8 space-y-2">
          <p className="px-4 text-xs font-semibold text-brand-textLight uppercase tracking-wider mb-4">Dashboard</p>
          <NavItem to="/overview" icon={<LayoutDashboard size={20} />} label="Overview" />
          <NavItem to="/patients" icon={<Users size={20} />} label="Patients" />
          <NavItem to="/doctors" icon={<UserRoundCog size={20} />} label="Doctors" />
          
          <p className="px-4 text-xs font-semibold text-brand-textLight uppercase tracking-wider mb-4 mt-8">System</p>
          <NavItem to="/settings" icon={<Settings size={20} />} label="Settings" />
        </nav>
        
        <div className="p-4 border-t border-gray-100">
          <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-brand-pinkLight">
            <div className="w-8 h-8 rounded-full bg-brand-pink flex items-center justify-center text-white font-bold text-sm">
              A
            </div>
            <div className="flex flex-col">
              <span className="text-sm font-semibold text-brand-dark">Admin</span>
              <span className="text-xs text-brand-textLight">admin@minerva.co</span>
            </div>
          </div>
        </div>
      </aside>

      {/* Main Content */}
      <main className="flex-1 flex flex-col h-full relative">
        {/* Header */}
        <header className="h-20 glass border-b border-gray-200 flex items-center justify-between px-8 z-10">
          <div className="relative w-96">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
            <input 
              type="text" 
              placeholder="Search patients, doctors, or ID..." 
              className="w-full pl-10 pr-4 py-2.5 rounded-full bg-gray-50 border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand-pink/50 transition-all text-sm"
            />
          </div>
          
          <div className="flex items-center gap-4">
            <button className="relative p-2.5 rounded-full hover:bg-gray-100 transition-colors text-gray-600">
              <Bell size={22} />
              <span className="absolute top-2 right-2 w-2 h-2 bg-brand-pink rounded-full border-2 border-white"></span>
            </button>
            <div className="h-8 w-[1px] bg-gray-200 mx-2"></div>
            <div className="text-sm font-medium text-brand-dark">Today, 12 Jun</div>
          </div>
        </header>

        {/* Page Content */}
        <div className="flex-1 overflow-auto p-8 relative z-0">
          <Outlet />
        </div>
      </main>
    </div>
  )
}

function NavItem({ to, icon, label }) {
  return (
    <NavLink
      to={to}
      className={({ isActive }) => 
        `flex items-center gap-3 px-4 py-3 rounded-xl transition-all duration-200 font-medium ${
          isActive 
            ? 'bg-brand-pink text-white shadow-md shadow-brand-pink/30' 
            : 'text-brand-text hover:bg-gray-50 hover:text-brand-dark'
        }`
      }
    >
      {icon}
      <span>{label}</span>
    </NavLink>
  )
}
