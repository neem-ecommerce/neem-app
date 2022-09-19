import { NextFunction, Request, Response, Router } from "express";
import * as Joi from 'joi';

const router = Router();

router.post('/login',
async (
    req: Request,
    res: Response,
    next: NextFunction
) => {
    const schema = Joi.object({
        email: Joi.string().email(),
        password: Joi.string()
    });
    const {error} = schema.validate(req.body);
    console.error(JSON.stringify(error))
    next(error);
},
async (
    req: Request,
    res: Response,
    next: NextFunction
) => {
    console.log('login params', req.body);
    res.send('success');
});

export default router;