import request from '@/utils/request'

// 查询Alarm Template列表
export function listTemplate(query) {
  return request({
    url: '/alarm/template/list',
    method: 'get',
    params: query
  })
}

// 查询Alarm Template详细
export function getTemplate(id) {
  return request({
    url: '/alarm/template/' + id,
    method: 'get'
  })
}

export function getTemplateList(query) {

  return request({
    url: '/alarm/template/getTemplateList',
    method: 'get',
    params: query
  })
}

// 新增Alarm Template
export function addTemplate(data) {
  return request({
    url: '/alarm/template',
    method: 'post',
    data: data
  })
}

// 修改Alarm Template
export function updateTemplate(data) {
  return request({
    url: '/alarm/template',
    method: 'put',
    data: data
  })
}

// 删除Alarm Template
export function delTemplate(id) {
  return request({
    url: '/alarm/template/' + id,
    method: 'delete'
  })
}
