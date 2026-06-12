import React from 'react'
import { MoreVertical, ShieldAlert } from 'lucide-react'

export default function Patients() {
  const patients = [
    { id: 'PAT-1042', alias: 'Patient A', status: 'Active', joined: 'Oct 12, 2025', permissions: 2 },
    { id: 'PAT-1043', alias: 'Patient B', status: 'Active', joined: 'Nov 04, 2025', permissions: 0 },
    { id: 'PAT-1044', alias: 'Patient C', status: 'Inactive', joined: 'Dec 19, 2025', permissions: 1 },
    { id: 'PAT-1045', alias: 'Patient D', status: 'Active', joined: 'Jan 02, 2026', permissions: 3 },
  ];

  return (
    <div className="space-y-6 h-full flex flex-col">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-2xl font-bold text-brand-dark">Patient Management</h1>
          <p className="text-brand-textLight text-sm mt-1">Manage patient accounts and monitor privacy settings.</p>
        </div>
        <div className="flex items-center gap-2 bg-yellow-50 text-yellow-700 px-4 py-2 rounded-lg border border-yellow-200">
          <ShieldAlert size={18} />
          <span className="text-sm font-medium">Strict Privacy Enforced</span>
        </div>
      </div>

      <div className="glass rounded-2xl flex-1 overflow-hidden flex flex-col">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-gray-50/80 border-b border-gray-200 text-sm font-semibold text-brand-dark">
                <th className="py-4 px-6">ID</th>
                <th className="py-4 px-6">Alias</th>
                <th className="py-4 px-6">Status</th>
                <th className="py-4 px-6">Joined</th>
                <th className="py-4 px-6">Active Doctor Consents</th>
                <th className="py-4 px-6 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="text-sm text-gray-700">
              {patients.map((p) => (
                <tr key={p.id} className="border-b border-gray-100 hover:bg-gray-50/50 transition-colors">
                  <td className="py-4 px-6 font-medium text-brand-dark">{p.id}</td>
                  <td className="py-4 px-6">
                    <div className="flex items-center gap-3">
                      <div className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-xs font-bold text-gray-500">
                        {p.alias.charAt(8)}
                      </div>
                      {p.alias}
                    </div>
                  </td>
                  <td className="py-4 px-6">
                    <span className={`px-2.5 py-1 rounded-full text-xs font-medium ${
                      p.status === 'Active' ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-700'
                    }`}>
                      {p.status}
                    </span>
                  </td>
                  <td className="py-4 px-6 text-brand-textLight">{p.joined}</td>
                  <td className="py-4 px-6">
                    <div className="flex items-center gap-2">
                      <div className="w-full bg-gray-200 rounded-full h-1.5 max-w-[100px]">
                        <div className="bg-brand-pink h-1.5 rounded-full" style={{ width: `${(p.permissions / 5) * 100}%` }}></div>
                      </div>
                      <span className="text-xs font-medium">{p.permissions} doctors</span>
                    </div>
                  </td>
                  <td className="py-4 px-6 text-right">
                    <button className="p-2 hover:bg-gray-100 rounded-lg text-gray-500 transition-colors">
                      <MoreVertical size={18} />
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        
        {/* Pagination placeholder */}
        <div className="p-4 border-t border-gray-100 flex items-center justify-between text-sm text-gray-500 mt-auto bg-white/50">
          <span>Showing 1 to 4 of 1,248 patients</span>
          <div className="flex gap-2">
            <button className="px-3 py-1 border border-gray-200 rounded-md hover:bg-gray-50 disabled:opacity-50" disabled>Previous</button>
            <button className="px-3 py-1 border border-gray-200 rounded-md hover:bg-gray-50">Next</button>
          </div>
        </div>
      </div>
    </div>
  )
}
