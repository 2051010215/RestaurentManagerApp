import { useContext } from "react";
import { MyUserContext } from "../App";
import MySpinner from "../layout/MySpinner";
import { Button } from "react-bootstrap";

const UserDetails = () => {
    const [user, dispatch ] = useContext(MyUserContext);
    
    const logout = () => {
        dispatch({
            "type": "logout"
        })
    }

    if (user === null)
        return <MySpinner/>

    return (
        <>
            <section className=" mt-3 bg-light bg-gradient ">
                <div className="container py-5 h-100">
                    <div className="row d-flex justify-content-center align-items-center h-100">
                        <div className="col col-lg-6 mb-4 mb-lg-0">
                            <div className="card mb-3" style={{ borderRadius: '.6rem', borderColor:'lightblue' }}>
                                <div className="row g-0">
                                    <div className="col-md-4 text-center text-white bg-info bg-gradient" style={{ borderTopLeftRadius: '.6rem', borderBottomLeftRadius: '.6rem'}}>
                                        <img src={user.avatar} alt="Avatar" className="img-fluid my-5" style={{ width: 165 }} />
                                        <h5>{user.username}</h5>
                                        <p>{user.userRole}</p>
                                        <i className="far fa-edit mb-5" />
                                    </div>
                                    <div className="col-md-8">
                                        <div className="card-body p-4">
                                            <h5>User Information</h5>
                                            <hr className="mt-0 mb-4" />
                                            <div className="row pt-1">
                                                <div className="col-6 mb-3">
                                                    <h6>Email</h6>
                                                    <p className="text-muted">{user.email}</p>
                                                </div>
                                                <div className="col-6 mb-3">
                                                    <h6>Phone</h6>
                                                    <p className="text-muted">{user.phone}</p>
                                                </div>
                                            </div>
                                            <h6>Projects</h6>
                                            <hr className="mt-0 mb-4" />
                                            <div className="row pt-1">
                                                <div className="col-6 mb-3">
                                                    <h6>Recent</h6>
                                                    <p className="text-muted">Lorem ipsum</p>
                                                </div>
                                                <div className="col-6 mb-3">
                                                    <h6>Most Viewed</h6>
                                                    <p className="text-muted">Dolor sit amet</p>
                                                </div>
                                            </div>
                                            <div className="d-flex me-5">
                                                
                                                <Button className="me-4" varient>Chỉnh sửa thông tin</Button>
                                                <Button onClick={logout} variant="danger">Đăng xuất</Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </>
    )
}

export default UserDetails;