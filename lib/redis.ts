import Redis from "ioredis";

const redis = new Redis({
  host: "redis-14517.c212.ap-south-1-1.ec2.cloud.redislabs.com",
  port: 14517,
  username: "default",
  password: process.env.REDIS_PASSWORD,
});

export default redis;
