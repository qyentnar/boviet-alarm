import request from '@/utils/request'

// 查询Alarm Main列表
export function listMain(query) {
  return request({
    url: '/alarm/main/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Main详细
export function getMain(id) {
  return request({
    url: '/alarm/main/' + id,
    method: 'get'
  })
}

// 新增Alarm Main
export function addMain(data) {
  return request({
    url: '/alarm/main',
    method: 'post',
    data: data
  })
}


export function updateRules(data) {
  return request({
    url: '/alarm/main/updateRules',
    method: 'post',
    data: data
  })
}


// 修改Alarm Main
export function updateMain(data) {
  return request({
    url: '/alarm/main',
    method: 'put',
    data: data
  })
}

// 删除Alarm Main
export function delMain(id) {
  return request({
    url: '/alarm/main/' + id,
    method: 'delete'
  })
}
