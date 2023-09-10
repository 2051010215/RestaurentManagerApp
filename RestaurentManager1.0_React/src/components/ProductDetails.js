import { useContext, useEffect, useState } from "react";
import { Button, Col, Form, Image, ListGroup, Row } from "react-bootstrap";
import Moment from "react-moment";
import { Link, useParams } from "react-router-dom";
import { MyCartContext, MyUserContext } from "../App";
import Apis, { authApi, endpoints } from "../configs/Apis";
import MySpinner from "../layout/MySpinner";
import cookie from "react-cookies";

const ProductDetails = () => {
    const [, cartDispatch] = useContext(MyCartContext);
    const [user, ] = useContext(MyUserContext);
    const { productId } = useParams();
    const [product, setProduct] = useState(null);
    const [comments, setComments] = useState(null);
    const [content, setContent] = useState();

    useEffect(() => {
        const loadProduct = async () => {
            let { data } = await Apis.get(endpoints['details'](productId));
            setProduct(data);
        }

        const loadComments = async () => {
            let { data } = await Apis.get(endpoints['comments'](productId));
            setComments(data);
        }

        loadProduct();
        loadComments();
    }, [productId]);

    const order = (product) => {
        let cart = cookie.load("cart") || null;
        if (cart === null)
            cart = {};
        
        if (product.id in cart) {
            // có trong giỏ
            cart[product.id]["quantity"] += 1;
        } else {
            // không có trong giỏ
            cart[product.id] = {
                "id": product.id,
                "name": product.name,
                "quantity": 1,
                "unitPrice": product.price
            };
        }

        cookie.save("cart", cart);

        cartDispatch({
            "type": "inc",
            "payload": 1
        });
    }

    const addComment = () => {
        const process = async () => {
            let { data } = await authApi().post(endpoints['add-comment'], {
                "content": content,
                "product": product.id
            });
            setComments([data, ...comments]);
        }

        process();
    }

    if (product === null || comments === null)
        return <MySpinner />

    let url = `/login?next=/products/${product.id}`;
    return <>
        <h1 className="text-center text-info mt-3 mb-5">CHI TIẾT SẢN PHẨM SỐ {productId}</h1>

        <Row>
            <Col>
                <Image src={product.image} rounded fluid className="border border-info" />
            </Col>
            <Col>
                <h2 className="text-danger">{product.name}</h2>
                <p>{product.description}</p>
                <h3>{product.price} VNĐ</h3>
                <hr/>
                <Button className="mt-3" variant="danger" onClick={() => order(product)}>Thêm vào giỏ</Button>
            </Col>
        </Row>
        <hr />
        {user===null?<p>Vui lòng <Link to={url}>đăng nhập</Link> để bình luận!</p>:<>
            <Form.Control as="textarea" value={content} onChange={e => setContent(e.target.value)} rows={4} placeholder="Bạn nghĩ gì về món này ăn..." />
            <Button variant="info" onClick={addComment} className="mt-2 mb-2">Thêm cảm nghĩ</Button>
        </>}
        <hr />
        <ListGroup className="mt-2 mb-2">
            {comments.map(c => <ListGroup.Item key={c.id}>
                
                <p className="text-uppercase fs-5">
                    <img src={c.user.avatar} className="rounded-circle me-2" style={{width: 40}} alt="Avatar" ></img>
                    {c.user.username}
                </p> - {c.content} - <mark><Moment locale="vi" fromNow>{c.createdDate}</Moment></mark>
            </ListGroup.Item>)}
        </ListGroup>
    </>
}

export default ProductDetails;