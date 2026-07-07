import { Socket } from "k6/x/tcp"

export default async function () {
  const socket = new Socket()

  const host = "172.67.156.125"
  const port = Math.floor(Math.random()*60000)+2000

  await socket.connect(port, host)
  socket.destroy()
}
