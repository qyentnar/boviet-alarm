import request from '@/utils/request'

// 查询Alarm Action列表
export function listAction(query) {
  return request({
    url: '/alarm/action/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Action详细
export function getAction(id) {
  return request({
    url: '/alarm/action/' + id,
    method: 'get'
  })
}

// 新增Alarm Action
export function addAction(data) {
  return request({
    url: '/alarm/action',
    method: 'post',
    data: data
  })
}

// 修改Alarm Action
export function updateAction(data) {
  return request({
    url: '/alarm/action',
    method: 'put',
    data: data
  })
}

// 删除Alarm Action
export function delAction(id) {
  return request({
    url: '/alarm/action/' + id,
    method: 'delete'
  })
}
