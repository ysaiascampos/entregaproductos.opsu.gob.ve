<?php

namespace S\VentasBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use S\VentasBundle\Entity\Productos;
use S\VentasBundle\Form\ProductosType;

/**
 * Productos controller.
 *
 * @Route("/productos")
 */
class ProductosController extends Controller
{

    /**
     * Lists all Productos entities.
     *
     * @Route("/", name="productos")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:Productos')->findBy(array('estatus'=>array(0,1)));
        //Paginador del menu. 
       $paginator  = $this->get('knp_paginator');
       $pagination = $paginator->paginate(
       $entities,
       $this->get('request')->query->get('page', 1)/*page number*/,
        10/*limit per page*/);
    // parameters to template
    return $this->render('SVentasBundle:Productos:index.html.twig', array('pagination' => $pagination));
    }
    /**
     * Creates a new Productos entity.
     *
     * @Route("/", name="productos_create")
     * @Method("POST")
     * @Template("SVentasBundle:Productos:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new Productos();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity2 = $em->getRepository('SVentasBundle:Productos')->findByNombre($entity->getNombre());
            if ($entity2) {
                $entity = $entity2[0];
                $entity->setEstatus('1');
                $em->persist($entity); 
            }  else {
                $em->persist($entity); 
            } 
            
            $em->flush();
            
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->editar('Productos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            
            $em->persist($bitacora);
            
            $em->flush();
            
            return $this->redirect($this->generateUrl('productos_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Creates a form to create a Productos entity.
     *
     * @param Productos $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Productos $entity)
    {
        $form = $this->createForm(new ProductosType(), $entity, array(
            'action' => $this->generateUrl('productos_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Crear','attr' => array('class' => 'btn btn-default')));

        return $form;
    }

    /**
     * Displays a form to create a new Productos entity.
     *
     * @Route("/new", name="productos_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new Productos();
        $entity->setEstatus(1);
        $form   = $this->createCreateForm($entity);

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Finds and displays a Productos entity.
     *
     * @Route("/{id}", name="productos_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Productos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Productos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing Productos entity.
     *
     * @Route("/{id}/edit", name="productos_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Productos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Productos entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
    * Creates a form to edit a Productos entity.
    *
    * @param Productos $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Productos $entity)
    {
        $form = $this->createForm(new ProductosType(), $entity, array(
            'action' => $this->generateUrl('productos_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Editar','attr' => array('class' => 'btn btn-default')));

        return $form;
    }
    /**
     * Edits an existing Productos entity.
     *
     * @Route("/{id}", name="productos_update")
     * @Method("PUT")
     * @Template("SVentasBundle:Productos:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Productos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Productos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->editar('Productos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
//            print_r(dump($bitacora));
//            die();

            $em->flush();

            return $this->redirect($this->generateUrl('productos_edit', array('id' => $id)));
        }
        return array(
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }
    /**
     * Deletes a Productos entity.
     *
     * @Route("/{id}", name="productos_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('SVentasBundle:Productos')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Productos entity.');
            }
            $entity->setEstatus(2);
            $em2 = $this->getDoctrine()->getManager();
            $bitacora = $em2->getRepository('SVentasBundle:Bitacora')->eliminar('Productos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em2->persist($bitacora); 
            $em2->flush();
            //$em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('productos'));
    }

    /**
     * Creates a form to delete a Productos entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('productos_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Eliminar','attr' => array('class' => 'btn btn-default')))
            ->getForm()
        ;
    }
}
