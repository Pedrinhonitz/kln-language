module TypeChecker where 

import Lexer 

typeof :: Expr -> Maybe Ty 
typeof (Num _) = Just TNum 
typeof BTrue = Just TBool
typeof BFalse = Just TBool
typeof (Add e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum
                       _ -> Nothing 
typeof (Sub e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum
                       _ -> Nothing 
typeof (Mult e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum
                       _ -> Nothing 
typeof (Div e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum
                       _ -> Nothing 
typeof (DivRest e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum
                       _ -> Nothing 
typeof (Potencia e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum
                       _ -> Nothing 
typeof (And e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TBool, Just TBool) -> Just TBool
                       _ -> Nothing
typeof (Or e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TBool, Just TBool) -> Just TBool
                       _ -> Nothing          
typeof (Not e) = case typeof e of
                   Just TBool -> Just TBool
                   _ -> Nothing
typeof (Eq e1 e2) = case (typeof e1, typeof e2) of 
                      (Just t1, Just t2) | t1 == t2 -> Just TBool 
                                         | otherwise -> Nothing 
                      _ -> Nothing
typeof (Diff e1 e2) = case (typeof e1, typeof e2) of 
                      (Just t1, Just t2) | t1 == t2 -> Just TBool 
                                         | otherwise -> Nothing 
                      _ -> Nothing
typeof (MenoIngual e1 e2) = case (typeof e1, typeof e2) of 
                      (Just t1, Just t2) | t1 == t2 -> Just TBool 
                                         | otherwise -> Nothing 
                      _ -> Nothing
typeof (Meno e1 e2) = case (typeof e1, typeof e2) of 
                      (Just t1, Just t2) | t1 == t2 -> Just TBool 
                                         | otherwise -> Nothing 
                      _ -> Nothing
typeof (MaioIngual e1 e2) = case (typeof e1, typeof e2) of 
                      (Just t1, Just t2) | t1 == t2 -> Just TBool 
                                         | otherwise -> Nothing 
                      _ -> Nothing
typeof (Maio e1 e2) = case (typeof e1, typeof e2) of 
                      (Just t1, Just t2) | t1 == t2 -> Just TBool 
                                         | otherwise -> Nothing 
                      _ -> Nothing
typeof (If e e1 e2) = case typeof e of 
                        Just TBool -> case (typeof e1, typeof e2) of 
                                        (Just t1, Just t2) | t1 == t2 -> Just t1 
                                                           | otherwise -> Nothing
                                        _ -> Nothing
                        _ -> Nothing

typecheck :: Expr -> Expr 
typecheck e = case typeof e of 
                (Just _) -> e 
                _        -> error ("Erro verificando tipo da expressão: " ++ show e)