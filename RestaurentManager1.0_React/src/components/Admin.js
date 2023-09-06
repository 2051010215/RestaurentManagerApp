import { useEffect, useState } from "react"
import { Alert, Button, Card, Col, Row } from "react-bootstrap";
import { Link, useSearchParams } from "react-router-dom";
import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "../layout/MySpinner";

const Admin = () => {
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
        <div className="d-flex flex-row-reverse " style={{marginRight: '18px'}}>
        <Link to="/addfood"><Button className="mt-2" variant="primary" >Thêm Món</Button></Link>
        </div>
        <Row>
                {products.map(p => {
                    let url =  `/products/${p.id}`;
                    return <Col xs={12} md={3} className="mt-3">
                                <Card style={{ width: '18rem' }}>
                                    <Card.Img variant="top" src={p.image} />
                                    <Card.Body>
                                        <Card.Title>{p.name}</Card.Title>
                                        <Card.Text>{p.price} VNĐ</Card.Text>
                                        <Link to={url}><Button className="mb-2 w-100" variant="primary">Xem chi tiết</Button></Link>
                                        <Row className="col text-center">
                                            <Col><Button className="w-100" xs="auto" variant="success">Cập nhật</Button></Col>
                                            <Col><Button className="w-100" xs="auto" variant="danger">Xóa</Button></Col>
                                        </Row>
                                        
                                    </Card.Body>
                                </Card>
                            </Col>
                })}   
        </Row>
        </>
    )
}

export default Admin