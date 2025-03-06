import request from '@/utils/request'

// 查询Alarm Log列表
export function listLog(query) {
  return request({
    url: '/alarm/log/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Log详细
export function getLog(id) {
  return request({
    url: '/alarm/log/' + id,
    method: 'get'
  })
}

// 新增Alarm Log
export function addLog(data) {
  return request({
    url: '/alarm/log',
    method: 'post',
    data: data
  })
}

// 修改Alarm Log
export function updateLog(data) {
  return request({
    url: '/alarm/log',
    method: 'put',
    data: data
  })
}

// 删除Alarm Log
export function delLog(id) {
  return request({
    url: '/alarm/log/' + id,
    method: 'delete'
  })
}
