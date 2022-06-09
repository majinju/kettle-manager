
let setWatermark = (str:any) => {
    let id = '3.1415926'
    if (document.getElementById(id) !== null) {
        document.body.removeChild(document.getElementById(id) as HTMLElement)
    }
    let can = document.createElement('canvas')
    can.width = 300
    can.height= 120
    let cans = can.getContext('2d')
    cans!.rotate(-25 * Math.PI / 180);
    cans!.font = '18px vedana'
    cans!.fillStyle = 'rgba(32, 184, 228, 0.25)'
    cans!.textAlign = 'left'
    cans!.textBaseline = 'middle'
    cans!.fillText(str, 0, can.height)
    let url = can.toDataURL('image/png')
    let div = document.createElement('div')
    div.id = id
    div.style.pointerEvents = 'none'
    div.style.top = '30px'
    div.style.left = '0px'
    div.style.position = 'fixed'
    div.style.zIndex = '100000'
    div.style.width = document.documentElement.clientWidth + 'px'
    div.style.height = document.documentElement.clientHeight + 'px'
    div.style.background = `url(${url}) left top repeat`
    document.body.appendChild(div)
    return id
}
let times:any = null
let watermark = {
    times: null,
    set: (str:any) => {
        clearInterval(times)
        let id = setWatermark(str)
        times = setInterval(() => {
            if (document.getElementById(id) === null) {
                id = setWatermark(str);
            }
        }, 2000);
        window.onresize = () => {
            setWatermark(str)
        }
    }
}
export default watermark
