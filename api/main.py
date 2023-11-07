from typing import Union

from pydantic import BaseModel



class Item(BaseModel):
    a: int
    b: int



from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/calculate")
def read_item(item:Item):
    return {"result":item.a+item.b}
