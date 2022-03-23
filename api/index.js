const http = uni.$u.http

export const login = data => http.post('/users/login', data)
export const register = data => http.post('/users/register', data)
export const updateUserInfo = data => http.post('/userInfo', data)

export const getMenu = () => http.get('/menu.json')
export const getSwiper = () => http.get('/banner.json')
export const getHotList = params => http.get('/goods', { params })
export const getDetail = id => http.get(`/goods/${id}`)

export const getCart = () => http.get('/cart')
export const addCart = data => http.post('/cart', data)
export const editCart = data => http.put('/cart', data)
export const removeCart = data => http.post('/cart/remove', data)
export const selectAllCart = data => http.post('/cart/selectAll', data)
export const upload = data => http.post('/users/upload', data)

export const addOrder = data => http.post('/order', data)
export const getOrder = () => http.get('/order')
export const updateOrder = (id, data) => http.put(`/order/${id}`, data)
