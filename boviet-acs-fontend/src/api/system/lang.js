import request from '@/utils/request'

// 查询系统语言列表
export function listLang(query) {
  return request({
    url: '/system/lang/list',
    method: 'get',
    params: query
  })
}

// 查询系统语言详细
export function getLang(id) {
  return request({
    url: '/system/lang/' + id,
    method: 'get'
  })
}

// 查询系统语言详细
export function getPageLang(language) {
  return request({
    url: '/system/lang/getPageLang',
    method: 'get',
    params: language
  })
}

// 新增系统语言
export function addLang(data) {
  return request({
    url: '/system/lang',
    method: 'post',
    data: data
  })
}

// 修改系统语言
export function updateLang(data) {
  return request({
    url: '/system/lang',
    method: 'put',
    data: data
  })
}

// 删除系统语言
export function delLang(id) {
  return request({
    url: '/system/lang/' + id,
    method: 'delete'
  })
}
