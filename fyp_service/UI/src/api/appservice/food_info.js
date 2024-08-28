import request from '@/utils/request'

// 查询食物信息列表
export function listFood_info(query) {
  return request({
    url: '/appservice/food_info/list',
    method: 'get',
    params: query
  })
}

// 查询食物信息详细
export function getFood_info(foodId) {
  return request({
    url: '/appservice/food_info/' + foodId,
    method: 'get'
  })
}

// 新增食物信息
export function addFood_info(data) {
  return request({
    url: '/appservice/food_info',
    method: 'post',
    data: data
  })
}

// 修改食物信息
export function updateFood_info(data) {
  return request({
    url: '/appservice/food_info',
    method: 'put',
    data: data
  })
}

// 删除食物信息
export function delFood_info(foodId) {
  return request({
    url: '/appservice/food_info/' + foodId,
    method: 'delete'
  })
}
