import { useEffect, useState } from "react"
import { Alert, Button, Card, Col, Row } from "react-bootstrap";
import { useSearchParams } from "react-router-dom";
import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "../layout/MySpinner";

const Home = () => {
    const [products, setProducts] = useState(null);
    const [q] = useSearchParams();

    useEffect(() => {
        const loadProducts = async () => {
           try {
            let e = endpoints['products'];

            let cateId = q.get("cateId");
            if (cateId !== null)
                e = `${e}?cateId=${cateId}`;
            else {
                let kw = q.get("kw");
                if (kw !== null)
                    e = `${e}?kw=${kw}`;
            }
            
            let res = await Apis.get(e);
            setProducts(res.data);
           } catch (ex) {
               console.error(ex);
           }
        }

        loadProducts();
    }, [q]); 


    if (products === null) 
        return <MySpinner />

    if (products.length === 0)
        return <Alert variant="info" className="mt-1">Không có sản phẩm nào!</Alert>

    return (
        <>
        <h1 className="text-center text-primary">Thực Đơn</h1>
        <Row>
                {products.map(p => {
                    return <Col xs={12} md={3} className="mt-5">
                                <Card style={{ width: '18rem' }}>
                                    <Card.Img variant="top" src={p.image} />
                                    <Card.Body>
                                        <Card.Title>{p.name}</Card.Title>
                                        <Card.Text>{p.price} VNĐ</Card.Text>
                                        <Row className="col text-center">
                                            <Col><Button xs="auto" variant="primary">Xem chi tiết</Button></Col>
                                            <Col><Button xs="auto" variant="success">Đặt món</Button></Col>
                                        </Row>
                                    </Card.Body>
                                </Card>
                            </Col>
                })}
            
        </Row>

        </>
    )
}

export default Home