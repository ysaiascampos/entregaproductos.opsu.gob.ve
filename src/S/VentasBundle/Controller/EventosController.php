<?php

namespace S\VentasBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use S\VentasBundle\Entity\Eventos;
use S\VentasBundle\Form\EventosType;
use S\VentasBundle\Entity\UserEvento;

/**
 * Eventos controller.
 *
 * @Route("/eventos")
 */
class EventosController extends Controller
{

    /**
     * Lists all Eventos entities.
     *
     * @Route("/", name="eventos")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        if('ROLE_SUPER_ADMIN'==$this->getUser()->getRoles()[0]){
            $entities = $em->getRepository('SVentasBundle:Eventos')->findAll();
        }else{
            $entities = $em->getRepository('SVentasBundle:Eventos')->findBy(array('estatus'=>array(0,1),'rolesUsuario'=>$this->getUser()->getRoles()[0]));
        }
        //Paginador del menu. 
        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        $entities,
        $this->get('request')->query->get('page', 1)/*page number*/,
         10/*limit per page*/);
        // parameters to template
        return $this->render('SVentasBundle:Eventos:index.html.twig', array('pagination' => $pagination));
    }
    /**
     * Creates a new Eventos entity.
     *
     * @Route("/", name="eventos_create")
     * @Method("POST")
     * @Template("SVentasBundle:Eventos:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new Eventos();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity2 = $em->getRepository('SVentasBundle:Eventos')->findByNombre($entity->getNombre());
            $entity->setRolesUsuario($this->getUser()->getRoles()[0]);
            if ($entity2) {
                $entity = $entity2[0];
                $entity->setEstatus('1');
                $em->persist($entity); 
            }  else {
                $em->persist($entity); 
            }
            
            $em->flush();

            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->crear('Eventos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();
            
            return $this->redirect($this->generateUrl('eventos_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Creates a form to create a Eventos entity.
     *
     * @param Eventos $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Eventos $entity)
    {
        $form = $this->createForm(new EventosType(), $entity, array(
            'action' => $this->generateUrl('eventos_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Crear','attr' => array('class' => 'btn btn-default')));

        return $form;
    }

    /**
     * Displays a form to create a new Eventos entity.
     *
     * @Route("/new", name="eventos_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new Eventos();
        $entity->setEstatus(1);
        $entity->setTipoPago(0);
        $form   = $this->createCreateForm($entity);

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Finds and displays a Eventos entity.
     *
     * @Route("/{id}", name="eventos_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Eventos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Eventos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing Eventos entity.
     *
     * @Route("/{id}/edit", name="eventos_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Eventos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Eventos entity.');
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
    * Creates a form to edit a Eventos entity.
    *
    * @param Eventos $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Eventos $entity)
    {
        $form = $this->createForm(new EventosType(), $entity, array(
            'action' => $this->generateUrl('eventos_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Editar','attr' => array('class' => 'btn btn-default')));

        return $form;
    }
    /**
     * Edits an existing Eventos entity.
     *
     * @Route("/{id}", name="eventos_update")
     * @Method("PUT")
     * @Template("SVentasBundle:Eventos:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Eventos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Eventos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->editar('Eventos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('eventos_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }
    /**
     * Deletes a Eventos entity.
     *
     * @Route("/{id}", name="eventos_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('SVentasBundle:Eventos')->find($id);
            
            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Personas entity.');
                
            }
            $entity->setEstatus(2);
            $em2 = $this->getDoctrine()->getManager();
            $bitacora = $em2->getRepository('SVentasBundle:Bitacora')->eliminar('Eventos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em2->persist($bitacora); 
            $em2->flush();
            
            //$entity->setEstatus(2);
            //$em->remove($entity);
            $em->flush();
            
        }

        return $this->redirect($this->generateUrl('eventos'));
    }

    /**
     * Creates a form to delete a Eventos entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('eventos_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Eliminar','attr' => array('class' => 'btn btn-default')))
            ->getForm()
        ;
    }
}
