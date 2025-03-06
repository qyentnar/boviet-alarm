import request from '@/utils/request'

// 查询Alarm Job列表
export function listJob(query) {
  return request({
    url: '/alarm/job/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Job详细
export function getJob(id) {
  return request({
    url: '/alarm/job/' + id,
    method: 'get'
  })
}

// 新增Alarm Job
export function addJob(data) {
  return request({
    url: '/alarm/job',
    method: 'post',
    data: data
  })
}

// 修改Alarm Job
export function updateJob(data) {
  return request({
    url: '/alarm/job',
    method: 'put',
    data: data
  })
}

// 删除Alarm Job
export function delJob(id) {
  return request({
    url: '/alarm/job/' + id,
    method: 'delete'
  })
}
