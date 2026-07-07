import { Socket } from "k6/x/tcp"

export default async function () {
  const socket = new Socket()

  const host = "172.67.156.125"
  const port = Math.floor(Math.random()*60000)+2000

  await socket.connect(port, host)
  socket.destroy()
}


sudo ./masscan -p80 2602:f41f:10:3105::1/106 --exclude 255.255.255.255 --max-rate 1000000000000