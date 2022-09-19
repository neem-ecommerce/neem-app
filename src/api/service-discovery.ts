import { Request, Response } from "express";

export default (req: Request, res: Response) => {
    console.log('api ready on port', process.env?.['PORT']);
    res.send('healthy :)');
}