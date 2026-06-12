import React from 'react'
import { CheckCircle, XCircle, Clock, Search, FileText } from 'lucide-react'

export default function Doctors() {
  const doctors = [
    { id: 'DOC-5021', name: 'Dr. Anya Sharma', specialty: 'Gynecology', status: 'Verified', experience: '12 yrs', rating: 4.9 },
    { id: 'DOC-5022', name: 'Dr. Sarah Jenkins', specialty: 'Pediatrics', status: 'Pending', experience: '8 yrs', rating: '-' },
    { id: 'DOC-5023', name: 'Dr. Anna Chen', specialty: 'Endocrinology', status: 'Verified', experience: '15 yrs', rating: 4.8 },
    { id: 'DOC-5024', name: 'Dr. Lisa Brown', specialty: 'Dermatology', status: 'Rejected', experience: '5 yrs', rating: '-' },
  ];

  return (
    <div className="space-y-6 h-full flex flex-col">
      <div className="flex justify-between items-end">
        <div>
          <h1 className="text-2xl font-bold text-brand-dark">Doctor Verification & Management</h1>
          <p className="text-brand-textLight text-sm mt-1">Review credentials and manage verified female practitioners.</p>
        </div>
        <div className="flex gap-3">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={16} />
            <input 
              type="text" 
              placeholder="Search doctors..." 
              className="pl-9 pr-4 py-2 border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-pink/50"
            />
          </div>
          <button className="bg-brand-pink hover:bg-brand-pinkHover text-white px-4 py-2 rounded-lg text-sm font-semibold transition-colors">
            Invite Doctor
          </button>
        </div>
      </div>

      {/* Analytics Cards specific to doctors */}
      <div className="grid grid-cols-3 gap-6">
        <div className="glass p-5 rounded-2xl border-l-4 border-l-green-500">
          <div className="text-sm text-gray-500 font-medium mb-1">Fully Verified</div>
          <div className="text-2xl font-bold text-brand-dark">142</div>
        </div>
        <div className="glass p-5 rounded-2xl border-l-4 border-l-orange-500">
          <div className="text-sm text-gray-500 font-medium mb-1">Verification Pending</div>
          <div className="text-2xl font-bold text-brand-dark">14</div>
        </div>
        <div className="glass p-5 rounded-2xl border-l-4 border-l-red-500">
          <div className="text-sm text-gray-500 font-medium mb-1">Rejected / Suspended</div>
          <div className="text-2xl font-bold text-brand-dark">3</div>
        </div>
      </div>

      <div className="glass rounded-2xl flex-1 overflow-hidden flex flex-col">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-gray-50/80 border-b border-gray-200 text-sm font-semibold text-brand-dark">
                <th className="py-4 px-6">ID</th>
                <th className="py-4 px-6">Doctor Name</th>
                <th className="py-4 px-6">Specialty</th>
                <th className="py-4 px-6">Experience</th>
                <th className="py-4 px-6">Verification Status</th>
                <th className="py-4 px-6 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="text-sm text-gray-700">
              {doctors.map((d) => (
                <tr key={d.id} className="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                  <td className="py-4 px-6 font-medium text-brand-dark">{d.id}</td>
                  <td className="py-4 px-6">
                    <div className="flex items-center gap-3">
                      <div className="w-8 h-8 rounded-full bg-brand-pinkLight flex items-center justify-center text-brand-pink font-bold">
                        {d.name.split(' ')[1].charAt(0)}
                      </div>
                      <div className="flex flex-col">
                        <span className="font-semibold">{d.name}</span>
                        {d.rating !== '-' && (
                          <span className="text-xs text-brand-textLight flex items-center gap-1">
                            <span className="text-yellow-400">★</span> {d.rating} Rating
                          </span>
                        )}
                      </div>
                    </div>
                  </td>
                  <td className="py-4 px-6">{d.specialty}</td>
                  <td className="py-4 px-6 text-brand-textLight">{d.experience}</td>
                  <td className="py-4 px-6">
                    <StatusBadge status={d.status} />
                  </td>
                  <td className="py-4 px-6 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <button className="p-1.5 text-gray-400 hover:text-blue-600 hover:bg-blue-50 rounded transition-colors" title="View Credentials">
                        <FileText size={18} />
                      </button>
                      {d.status === 'Pending' && (
                        <>
                          <button className="p-1.5 text-gray-400 hover:text-green-600 hover:bg-green-50 rounded transition-colors" title="Approve">
                            <CheckCircle size={18} />
                          </button>
                          <button className="p-1.5 text-gray-400 hover:text-red-600 hover:bg-red-50 rounded transition-colors" title="Reject">
                            <XCircle size={18} />
                          </button>
                        </>
                      )}
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}

function StatusBadge({ status }) {
  if (status === 'Verified') {
    return (
      <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-700 border border-green-200">
        <CheckCircle size={12} /> Verified
      </span>
    )
  }
  if (status === 'Pending') {
    return (
      <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-orange-100 text-orange-700 border border-orange-200">
        <Clock size={12} /> Pending Review
      </span>
    )
  }
  return (
    <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-red-100 text-red-700 border border-red-200">
      <XCircle size={12} /> Rejected
    </span>
  )
}
