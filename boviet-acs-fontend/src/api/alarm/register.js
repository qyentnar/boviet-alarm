import request from '@/utils/request'

// 查询Alarm Register列表
export function listRegister(query) {
  return request({
    url: '/alarm/register/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Register列表
export function getAlarmRegisterList(query) {
  return request({
    url: '/alarm/register/getAlarmRegisterList',
    method: 'get',
    params: query
  })
}

// 查询Alarm Register详细
export function getRegister(id) {
  return request({
    url: '/alarm/register/' + id,
    method: 'get'
  })
}

// 新增Alarm Register
export function addRegister(data) {
  return request({
    url: '/alarm/register',
    method: 'post',
    data: data
  })
}

// 修改Alarm Register
export function updateRegister(data) {
  return request({
    url: '/alarm/register',
    method: 'put',
    data: data
  })
}

// 删除Alarm Register
export function delRegister(id) {
  return request({
    url: '/alarm/register/' + id,
    method: 'delete'
  })
}
