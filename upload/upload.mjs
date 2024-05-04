import { PutObjectCommand, S3Client } from '@aws-sdk/client-s3';
import fs from 'fs';
import { parseArgs } from 'util';

const S3 = new S3Client({
  region: 'auto',
  endpoint: process.env.R2_ENDPOINT,
  credentials: {
    accessKeyId: process.env.R2_ACCESS_KEY,
    secretAccessKey: process.env.R2_SECRET_KEY,
  },
});

const options = {
  input: {
    type: 'string',
    short: 'i',
  },
  target: {
    type: 'string',
    short: 't',
  },
};
const { values } = parseArgs({ args: process.args, options });
console.log(values);

const fileStream = fs.createReadStream(values.input);

console.log(
  await S3.send(
    new PutObjectCommand({
      Bucket: process.env.R2_BUCKET,
      Key: values.target,
      Body: fileStream,
    })
  )
);
