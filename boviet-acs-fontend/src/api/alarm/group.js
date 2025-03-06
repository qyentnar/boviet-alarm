import request from '@/utils/request'

// 查询Alarm Group列表
export function listGroup(query) {
  return request({
    url: '/alarm/group/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Group详细
export function getGroup(id) {
  return request({
    url: '/alarm/group/' + id,
    method: 'get'
  })
}

// 新增Alarm Group
export function addGroup(data) {
  return request({
    url: '/alarm/group',
    method: 'post',
    data: data
  })
}

// 修改Alarm Group
export function updateGroup(data) {
  return request({
    url: '/alarm/group',
    method: 'put',
    data: data
  })
}

// 删除Alarm Group
export function delGroup(id) {
  return request({
    url: '/alarm/group/' + id,
    method: 'delete'
  })
}
