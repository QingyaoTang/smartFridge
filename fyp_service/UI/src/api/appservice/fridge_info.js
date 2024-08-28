import request from '@/utils/request'

// 查询冰箱信息列表
export function listFridge_info(query) {
  return request({
    url: '/appservice/fridge_info/list',
    method: 'get',
    params: query
  })
}

// 查询冰箱信息详细
export function getFridge_info(fridgeId) {
  return request({
    url: '/appservice/fridge_info/' + fridgeId,
    method: 'get'
  })
}

// 新增冰箱信息
export function addFridge_info(data) {
  return request({
    url: '/appservice/fridge_info',
    method: 'post',
    data: data
  })
}

// 修改冰箱信息
export function updateFridge_info(data) {
  return request({
    url: '/appservice/fridge_info',
    method: 'put',
    data: data
  })
}

// 删除冰箱信息
export function delFridge_info(fridgeId) {
  return request({
    url: '/appservice/fridge_info/' + fridgeId,
    method: 'delete'
  })
}
