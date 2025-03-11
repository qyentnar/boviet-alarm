import request from '@/utils/request'

// 查询Alarm Config列表
export function listConfig(query) {
  return request({
    url: '/alarm/config/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Config详细
export function getConfig(configType) {
  return request({
    url: '/alarm/config/' + configType,
    method: 'get'
  })
}

// 新增Alarm Config
export function addConfig(data) {
  return request({
    url: '/alarm/config',
    method: 'post',
    data: data
  })
}

// 修改Alarm Config
export function updateConfig(data) {
  return request({
    url: '/alarm/config',
    method: 'put',
    data: data
  })
}

// 删除Alarm Config
export function delConfig(id) {
  return request({
    url: '/alarm/config/' + id,
    method: 'delete'
  })
}
